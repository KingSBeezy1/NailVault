import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/core/di/app_providers.dart';
import 'package:nailvault/features/clients/data/repositories/client_repository.dart';
import 'package:nailvault/features/clients/domain/models/client_model.dart';

final clientRepositoryProvider = Provider<ClientRepository>((ref) {
  return ClientRepository(ref.watch(supabaseServiceProvider));
});

final clientsProvider = FutureProvider<List<ClientModel>>((ref) async {
  final repository = ref.watch(clientRepositoryProvider);
  return repository.fetchClients();
});
