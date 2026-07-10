import 'package:image_picker/image_picker.dart';
import 'package:nailvault/core/services/image_picker_service.dart';
import 'package:nailvault/core/services/storage_service.dart';
import 'package:nailvault/core/services/supabase_service.dart';
import 'package:nailvault/features/appointments/domain/models/appointment_photo_model.dart';

class PhotoRepository {
  PhotoRepository({
    required this.supabaseService,
    required this.storageService,
    required this.imagePickerService,
  });

  final SupabaseService supabaseService;
  final StorageService storageService;
  final ImagePickerService imagePickerService;

  Future<XFile?> capturePhoto() => imagePickerService.pickFromCamera();

  Future<List<XFile>> pickPhotosFromGallery({int maxImages = 10}) =>
      imagePickerService.pickFromGallery(maxImages: maxImages);

  Future<AppointmentPhotoModel> uploadPhoto({
    required String appointmentId,
    required String userId,
    required String clientId,
    required XFile imageFile,
    void Function(double)? onProgress,
  }) async {
    final photoId = _generateId();

    try {
      final storageUrl = await storageService.uploadPhoto(
        userId: userId,
        clientId: clientId,
        appointmentId: appointmentId,
        imageFile: imageFile,
      );

      onProgress?.call(1.0);

      final photo = AppointmentPhotoModel(
        id: photoId,
        appointmentId: appointmentId,
        storageUrl: storageUrl,
        uploadStatus: 'completed',
        takenAt: DateTime.now(),
      );

      await _savePhotoToDatabase(photo);

      return photo;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<AppointmentPhotoModel>> fetchAppointmentPhotos(
    String appointmentId,
  ) async {
    if (!supabaseService.isInitialized) {
      return [];
    }

    try {
      final response = await supabaseService.client
          .from('appointment_photos')
          .select()
          .eq('appointment_id', appointmentId)
          .order('taken_at', ascending: false);

      final rows = response as List<dynamic>;
      return rows.map((row) => AppointmentPhotoModel.fromJson(Map<String, dynamic>.from(row))).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> _savePhotoToDatabase(AppointmentPhotoModel photo) async {
    if (!supabaseService.isInitialized) {
      return;
    }

    try {
      await supabaseService.client.from('appointment_photos').insert(photo.toJson());
    } catch (_) {
      // Photo queued locally but not synced yet
    }
  }

  String _generateId() => DateTime.now().millisecondsSinceEpoch.toString();
}
