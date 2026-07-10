# NailVault

NailVault is a production-oriented Flutter app for nail technicians to manage clients, appointments, and photo portfolios with Supabase-backed storage and security.

## Architecture

Clean Architecture with feature-first folder structure:
- **Auth**: Sign in, sign up, forgot password, session handling
- **Dashboard**: Overview, quick actions, metrics
- **Clients**: Client records, history, detail view
- **Appointments**: Scheduling, appointment details, timeline
- **Gallery**: Fast search, portfolio viewing, image browsing
- **Camera**: Photo capture workflow with upload queue
- **Settings**: Configuration and preferences
- **Supabase**: SQL schema, RLS policies, storage bucket setup

## Key Features

### Photo Management (✓ Complete)
- Capture photos directly from camera
- Import multiple images from gallery
- Real-time upload progress tracking
- Offline queue with retry capability
- Display photos in grid layout within appointments
- Mark photos as favorites

### Appointments
- Schedule and manage appointments
- Associate photos with appointments
- Track duration, price, status
- Add tags for colors, shapes, designs
- Detailed appointment view with history

### Clients
- Create and manage client records
- Contact information (phone, email, Instagram)
- Birthday tracking
- Personal notes
- Appointment history per client
- Client detail view with statistics

### Authentication
- Email/password sign up
- Login with persistent session
- Password reset
- Secure auth state management

## Setup

1. Install dependencies:
```bash
flutter pub get
```

2. Generate code (Freezed models, JSON serialization):
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

3. Provide Supabase credentials via environment variables:
```bash
export SUPABASE_URL="https://your-project.supabase.co"
export SUPABASE_ANON_KEY="your-anon-key"
flutter run
```

## Database Schema

The Supabase schema includes:
- `profiles`: User workspace information
- `clients`: Client records with metadata
- `appointments`: Appointment records linked to clients
- `appointment_photos`: Photo metadata and storage URLs
- `products`: Product catalog for tracking used products
- `tags`: Custom tags for colors, shapes, designs
- All tables have Row-Level Security (RLS) policies for data isolation

See [supabase/schema.sql](supabase/schema.sql) for full schema definition.

## Navigation Routes

- `/sign-in` - Login screen
- `/sign-up` - Registration screen
- `/forgot-password` - Password recovery
- `/dashboard` - Home dashboard
- `/clients` - Client list
- `/appointments` - Appointment list
- `/appointment/:id/:clientId/:userId` - Appointment detail with photos
- `/camera/:appointmentId/:clientId/:userId` - Photo capture
- `/gallery` - Global photo gallery
- `/settings` - App settings

## State Management

Uses **Riverpod** with:
- Service providers for Supabase, image picker, storage
- Repository providers for data access
- Feature-specific notifiers for complex state (upload queue, auth)
- Family providers for parameterized queries

## Material 3 Design

- Pink and white color scheme (`#EA93B5` accent)
- Soft rounded cards and buttons
- Responsive layout
- Dark mode support
- Material You theming
