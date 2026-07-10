import 'package:nailvault/features/appointments/data/repositories/appointment_repository.dart';
import 'package:nailvault/features/appointments/data/repositories/photo_repository.dart';
import 'package:nailvault/features/clients/data/repositories/client_repository.dart';
import 'package:nailvault/features/search/domain/models/search_result.dart';

class SearchRepository {
  SearchRepository({
    required this.clientRepository,
    required this.appointmentRepository,
    required this.photoRepository,
  });

  final ClientRepository clientRepository;
  final AppointmentRepository appointmentRepository;
  final PhotoRepository photoRepository;

  Future<List<SearchResult>> search(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }

    final normalized = query.toLowerCase();
    final results = <SearchResult>[];

    try {
      // Search clients
      final clients = await clientRepository.fetchClients(query: query);
      results.addAll(
        clients.map(
          (client) => SearchResult(
            id: client.id,
            type: SearchResultType.client,
            title: '${client.firstName} ${client.lastName}',
            subtitle: client.email ?? client.phoneNumber,
          ),
        ),
      );

      // Search appointments by notes, colors, designs
      final appointments = await appointmentRepository.fetchAppointments(query: query);
      results.addAll(
        appointments.map(
          (appointment) => SearchResult(
            id: appointment.id,
            type: SearchResultType.appointment,
            title: appointment.notes ?? 'Appointment',
            subtitle: appointment.colorTags.join(', '),
          ),
        ),
      );

      // Search photos by notes
      final allPhotos = await photoRepository.fetchAppointmentPhotos('');
      final matchingPhotos = allPhotos.where((photo) {
        return (photo.notes?.toLowerCase().contains(normalized) ?? false);
      }).toList();

      results.addAll(
        matchingPhotos.map(
          (photo) => SearchResult(
            id: photo.id,
            type: SearchResultType.photo,
            title: photo.notes ?? 'Photo',
            subtitle: photo.uploadStatus,
            imageUrl: photo.storageUrl,
          ),
        ),
      );
    } catch (_) {
      // Return empty results if search fails
    }

    return results;
  }
}
