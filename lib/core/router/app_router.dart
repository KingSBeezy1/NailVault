import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nailvault/features/appointments/presentation/pages/add_appointment_page.dart';
import 'package:nailvault/features/appointments/presentation/pages/appointment_detail_page.dart';
import 'package:nailvault/features/appointments/presentation/pages/appointments_page.dart';
import 'package:nailvault/features/appointments/presentation/pages/camera_page.dart';
import 'package:nailvault/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:nailvault/features/auth/presentation/pages/sign_in_page.dart';
import 'package:nailvault/features/auth/presentation/pages/sign_up_page.dart';
import 'package:nailvault/features/auth/presentation/providers/auth_controller.dart';
import 'package:nailvault/features/auth/presentation/providers/auth_state.dart';
import 'package:nailvault/features/clients/presentation/pages/add_client_page.dart';
import 'package:nailvault/features/clients/presentation/pages/clients_page.dart';
import 'package:nailvault/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:nailvault/features/gallery/presentation/pages/gallery_page.dart';
import 'package:nailvault/features/search/presentation/pages/search_page.dart';
import 'package:nailvault/features/settings/presentation/pages/settings_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/sign-in',
    redirect: (context, state) {
      final location = state.matchedLocation;

      if (authState.status == AuthStatus.authenticated) {
        if (location == '/sign-in' || location == '/sign-up' || location == '/forgot-password') {
          return '/dashboard';
        }
      }

      if (authState.status == AuthStatus.unauthenticated || authState.status == AuthStatus.failure) {
        if (location == '/dashboard') {
          return '/sign-in';
        }
      }

      return null;
    },
    routes: [
      GoRoute(path: '/sign-in', builder: (context, state) => const SignInPage()),
      GoRoute(path: '/sign-up', builder: (context, state) => const SignUpPage()),
      GoRoute(path: '/forgot-password', builder: (context, state) => const ForgotPasswordPage()),
      GoRoute(path: '/dashboard', builder: (context, state) => const DashboardPage()),
      GoRoute(path: '/clients', builder: (context, state) => const ClientsPage()),
      GoRoute(path: '/appointments', builder: (context, state) => const AppointmentsPage()),
      GoRoute(
        path: '/appointment/:appointmentId/:clientId/:userId',
        builder: (context, state) => AppointmentDetailPage(
          appointmentId: state.pathParameters['appointmentId']!,
          clientId: state.pathParameters['clientId']!,
          userId: state.pathParameters['userId']!,
        ),
      ),
      GoRoute(
        path: '/camera/:appointmentId/:clientId/:userId',
        builder: (context, state) => CameraPage(
          appointmentId: state.pathParameters['appointmentId']!,
          clientId: state.pathParameters['clientId']!,
          userId: state.pathParameters['userId']!,
        ),
      ),
      GoRoute(path: '/gallery', builder: (context, state) => const GalleryPage()),
      GoRoute(path: '/search', builder: (context, state) => const SearchPage()),
      GoRoute(path: '/add-client', builder: (context, state) => const AddClientPage()),
      GoRoute(path: '/add-appointment', builder: (context, state) => const AddAppointmentPage()),
      GoRoute(path: '/settings', builder: (context, state) => const SettingsPage()),
    ],
  );
});
