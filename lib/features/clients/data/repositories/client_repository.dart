import 'package:nailvault/core/services/supabase_service.dart';
import 'package:nailvault/features/clients/domain/models/client_model.dart';

class ClientRepository {
  ClientRepository(this._supabaseService);

  final SupabaseService _supabaseService;

  final List<ClientModel> _demoClients = [
    ClientModel(
      id: 'demo-client-1',
      firstName: 'Maya',
      lastName: 'Lynn',
      phoneNumber: '+1 555 0101',
      email: 'maya@example.com',
      instagramUsername: 'maya.nails',
      notes: 'Prefers glossy pink finishes',
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
      updatedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    ClientModel(
      id: 'demo-client-2',
      firstName: 'Sofia',
      lastName: 'Rojas',
      phoneNumber: '+1 555 0102',
      email: 'sofia@example.com',
      instagramUsername: 'sofiacurves',
      notes: 'Loves chrome and almond shape',
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  Future<List<ClientModel>> fetchClients({String? query}) async {
    if (!_supabaseService.isInitialized) {
      return _filterDemoClients(query);
    }

    try {
      final response = await _supabaseService.client.from('clients').select().order('created_at', ascending: false);
      final rows = response as List<dynamic>;
      final clients = rows.map((row) => ClientModel.fromJson(Map<String, dynamic>.from(row))).toList();
      return _applyQuery(clients, query);
    } catch (_) {
      return _filterDemoClients(query);
    }
  }

  Future<ClientModel> createClient(ClientModel client) async {
    if (!_supabaseService.isInitialized) {
      return client;
    }

    try {
      final response = await _supabaseService.client.from('clients').insert(client.toJson()).select().single();
      return ClientModel.fromJson(Map<String, dynamic>.from(response));
    } catch (_) {
      return client;
    }
  }

  List<ClientModel> _filterDemoClients(String? query) {
    return _applyQuery(_demoClients, query);
  }

  List<ClientModel> _applyQuery(List<ClientModel> clients, String? query) {
    if (query == null || query.trim().isEmpty) {
      return clients;
    }

    final normalized = query.toLowerCase();
    return clients.where((client) {
      final fullName = '${client.firstName} ${client.lastName}'.toLowerCase();
      return fullName.contains(normalized) ||
          (client.email?.toLowerCase().contains(normalized) ?? false) ||
          (client.phoneNumber?.contains(normalized) ?? false);
    }).toList();
  }
}
