import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:nailvault/core/services/supabase_service.dart';

class StorageService {
  const StorageService(this._supabaseService);

  final SupabaseService _supabaseService;
  static const String bucketName = 'appointment-images';

  Future<String> uploadPhoto({
    required String userId,
    required String clientId,
    required String appointmentId,
    required XFile imageFile,
  }) async {
    if (!_supabaseService.isInitialized) {
      throw Exception('Storage is not available offline yet. Photo will be queued.');
    }

    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final path = '$userId/$clientId/$appointmentId/$fileName';

    final file = File(imageFile.path);
    final bytes = await file.readAsBytes();

    await _supabaseService.client.storage.from(bucketName).uploadBinary(
      path,
      bytes,
      fileOptions: FileOptions(contentType: 'image/jpeg'),
    );

    final url = _supabaseService.client.storage.from(bucketName).getPublicUrl(path);
    return url;
  }

  Future<void> deletePhoto({required String storagePath}) async {
    if (!_supabaseService.isInitialized) {
      return;
    }

    try {
      await _supabaseService.client.storage.from(bucketName).remove([storagePath]);
    } catch (_) {
      // Silently fail if deletion is not available
    }
  }

  String getStoragePath({
    required String userId,
    required String clientId,
    required String appointmentId,
    required String fileName,
  }) {
    return '$userId/$clientId/$appointmentId/$fileName';
  }
}
