import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/features/appointments/presentation/providers/appointments_provider.dart';
import 'package:nailvault/features/appointments/presentation/providers/photo_upload_provider.dart';
import 'package:nailvault/features/clients/presentation/providers/clients_provider.dart';
import 'package:nailvault/features/search/data/repositories/search_repository.dart';
import 'package:nailvault/features/search/domain/models/search_result.dart';

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepository(
    clientRepository: ref.watch(clientRepositoryProvider),
    appointmentRepository: ref.watch(appointmentRepositoryProvider),
    photoRepository: ref.watch(photoRepositoryProvider),
  );
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider<List<SearchResult>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  final searchRepository = ref.watch(searchRepositoryProvider);
  
  if (query.trim().isEmpty) {
    return [];
  }
  
  return searchRepository.search(query);
});
