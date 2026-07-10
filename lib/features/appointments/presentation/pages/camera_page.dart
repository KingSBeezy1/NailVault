import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nailvault/features/appointments/presentation/providers/photo_upload_provider.dart';

class CameraPage extends ConsumerStatefulWidget {
  const CameraPage({super.key, required this.appointmentId, required this.clientId, required this.userId});

  final String appointmentId;
  final String clientId;
  final String userId;

  @override
  ConsumerState<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<CameraPage> {
  @override
  Widget build(BuildContext context) {
    final uploadQueue = ref.watch(photoUploadQueueProvider);
    final photoRepository = ref.watch(photoRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Capture Photos')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: () async {
                      final image = await photoRepository.capturePhoto();
                      if (image != null && context.mounted) {
                        await ref.read(photoUploadQueueProvider.notifier).queuePhotoUpload(
                          imageFile: image,
                          appointmentId: widget.appointmentId,
                          userId: widget.userId,
                          clientId: widget.clientId,
                        );
                      }
                    },
                    icon: const Icon(Icons.photo_camera),
                    label: const Text('Take Photo'),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () async {
                      final images = await photoRepository.pickPhotosFromGallery();
                      if (images.isNotEmpty && context.mounted) {
                        for (final image in images) {
                          await ref.read(photoUploadQueueProvider.notifier).queuePhotoUpload(
                            imageFile: image,
                            appointmentId: widget.appointmentId,
                            userId: widget.userId,
                            clientId: widget.clientId,
                          );
                        }
                      }
                    },
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Pick from Gallery'),
                  ),
                ],
              ),
            ),
          ),
          if (uploadQueue.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Uploads (${uploadQueue.length})',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: uploadQueue.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final upload = uploadQueue[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      upload.status.name.toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: upload.status == UploadStatus.success
                                            ? Colors.green
                                            : upload.status == UploadStatus.failure
                                                ? Colors.red
                                                : null,
                                      ),
                                    ),
                                    if (upload.status == UploadStatus.failure)
                                      FilledButton.tonal(
                                        onPressed: () {
                                          ref.read(photoUploadQueueProvider.notifier).retryUpload(upload);
                                        },
                                        child: const Text('Retry'),
                                      ),
                                  ],
                                ),
                                if (upload.status == UploadStatus.uploading || upload.status == UploadStatus.queued)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: LinearProgressIndicator(value: upload.progress),
                                  ),
                                if (upload.errorMessage != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      upload.errorMessage!,
                                      style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton.icon(
              onPressed: uploadQueue.any((u) => u.status == UploadStatus.success || u.status == UploadStatus.uploading)
                  ? () => context.pop()
                  : null,
              icon: const Icon(Icons.check),
              label: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}

enum UploadStatus { queued, uploading, success, failure }
