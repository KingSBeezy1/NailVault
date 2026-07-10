import 'package:nailvault/core/services/supabase_service.dart';
import 'package:nailvault/features/appointments/domain/models/appointment_model.dart';

class AppointmentRepository {
  AppointmentRepository(this._supabaseService);

  final SupabaseService _supabaseService;

  final List<AppointmentModel> _demoAppointments = [
    AppointmentModel(
      id: 'demo-appointment-1',
      clientId: 'demo-client-1',
      date: DateTime.now().add(const Duration(hours: 3)),
      durationMinutes: 90,
      price: 145,
      status: 'scheduled',
      completed: false,
      cancelled: false,
      noShow: false,
      notes: 'Gel extensions and chrome overlay',
      productsUsed: const ['gel polish', 'top coat'],
      nailShape: 'almond',
      length: 'medium',
      colorTags: const ['pink', 'chrome'],
      designTags: const ['minimal', 'glossy'],
      createdAt: DateTime.now().subtract(const Duration(days: 8)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    AppointmentModel(
      id: 'demo-appointment-2',
      clientId: 'demo-client-2',
      date: DateTime.now().subtract(const Duration(days: 1)),
      durationMinutes: 60,
      price: 95,
      status: 'completed',
      completed: true,
      cancelled: false,
      noShow: false,
      notes: 'French ombré and hydration treatment',
      productsUsed: const ['builder gel'],
      nailShape: 'oval',
      length: 'short',
      colorTags: const ['white', 'pink'],
      designTags: const ['french'],
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 8)),
    ),
  ];

  Future<List<AppointmentModel>> fetchAppointments({String? query}) async {
    if (!_supabaseService.isInitialized) {
      return _filterDemoAppointments(query);
    }

    try {
      final response = await _supabaseService.client.from('appointments').select().order('date', ascending: false);
      final rows = response as List<dynamic>;
      final appointments = rows.map((row) => AppointmentModel.fromJson(Map<String, dynamic>.from(row))).toList();
      return _applyQuery(appointments, query);
    } catch (_) {
      return _filterDemoAppointments(query);
    }
  }

  List<AppointmentModel> _filterDemoAppointments(String? query) {
    return _applyQuery(_demoAppointments, query);
  }

  List<AppointmentModel> _applyQuery(List<AppointmentModel> appointments, String? query) {
    if (query == null || query.trim().isEmpty) {
      return appointments;
    }

    final normalized = query.toLowerCase();
    return appointments.where((appointment) {
      return appointment.notes?.toLowerCase().contains(normalized) ?? false ||
          appointment.colorTags.any((tag) => tag.toLowerCase().contains(normalized)) ||
          appointment.designTags.any((tag) => tag.toLowerCase().contains(normalized));
    }).toList();
  }
}
