import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nailvault/core/di/app_providers.dart';
import 'package:nailvault/core/services/image_picker_service.dart';
import 'package:nailvault/core/services/storage_service.dart';
import 'package:nailvault/features/appointments/data/repositories/photo_repository.dart';
import 'package:nailvault/features/appointments/domain/models/photo_upload_state.dart';

final imagePickerServiceProvider = Provider<ImagePickerService>((ref) {
  return ImagePickerService();
});

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService(ref.watch(supabaseServiceProvider));
});

final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  return PhotoRepository(
    supabaseService: ref.watch(supabaseServiceProvider),
    storageService: ref.watch(storageServiceProvider),
    imagePickerService: ref.watch(imagePickerServiceProvider),
  );
});

final photoUploadQueueProvider = StateNotifierProvider<PhotoUploadQueueNotifier, List<PhotoUploadState>>(
  (ref) => PhotoUploadQueueNotifier(ref.watch(photoRepositoryProvider)),
);

class PhotoUploadQueueNotifier extends StateNotifier<List<PhotoUploadState>> {
  PhotoUploadQueueNotifier(this._photoRepository) : super([]);

  final PhotoRepository _photoRepository;

  Future<void> queuePhotoUpload({
    required XFile imageFile,
    required String appointmentId,
    required String userId,
    required String clientId,
  }) async {
    final uploadState = PhotoUploadState(
      localPath: imageFile.path,
      appointmentId: appointmentId,
      status: UploadStatus.queued,
    );

    state = [...state, uploadState];

    try {
      await _photoRepository.uploadPhoto(
        appointmentId: appointmentId,
        userId: userId,
        clientId: clientId,
        imageFile: imageFile,
        onProgress: (progress) {
          _updateProgress(uploadState, progress);
        },
      );

      _markSuccess(uploadState);
    } catch (error) {
      _markFailure(uploadState, error.toString());
    }
  }

  void _updateProgress(PhotoUploadState uploadState, double progress) {
    state = state.map((upload) {
      if (upload.localPath == uploadState.localPath) {
        return upload.copyWith(status: UploadStatus.uploading, progress: progress);
      }
      return upload;
    }).toList();
  }

  void _markSuccess(PhotoUploadState uploadState) {
    state = state.map((upload) {
      if (upload.localPath == uploadState.localPath) {
        return upload.copyWith(status: UploadStatus.success, progress: 1.0);
      }
      return upload;
    }).toList();
  }

  void _markFailure(PhotoUploadState uploadState, String errorMessage) {
    state = state.map((upload) {
      if (upload.localPath == uploadState.localPath) {
        return upload.copyWith(status: UploadStatus.failure, errorMessage: errorMessage);
      }
      return upload;
    }).toList();
  }

  void removeUpload(PhotoUploadState uploadState) {
    state = state.where((upload) => upload.localPath != uploadState.localPath).toList();
  }

  void retryUpload(PhotoUploadState uploadState) {
    state = state.map((upload) {
      if (upload.localPath == uploadState.localPath) {
        return upload.copyWith(status: UploadStatus.queued, progress: 0);
      }
      return upload;
    }).toList();
  }
}
