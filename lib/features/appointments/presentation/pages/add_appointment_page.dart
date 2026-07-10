import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/features/clients/presentation/providers/clients_provider.dart';
import 'package:nailvault/features/shared/widgets/primary_button.dart';

class AddAppointmentPage extends ConsumerStatefulWidget {
  const AddAppointmentPage({super.key});

  @override
  ConsumerState<AddAppointmentPage> createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends ConsumerState<AddAppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedClientId;
  late final TextEditingController _priceController;
  late final TextEditingController _notesController;
  late final TextEditingController _colorTagsController;
  late final TextEditingController _designTagsController;
  String? _selectedShape;
  String? _selectedLength;
  int _durationMinutes = 60;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  late bool _isSubmitting;

  final _shapes = ['Square', 'Round', 'Almond', 'Oval', 'Coffin', 'Stiletto'];
  final _lengths = ['Short', 'Medium', 'Long', 'Extra Long'];

  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController();
    _notesController = TextEditingController();
    _colorTagsController = TextEditingController();
    _designTagsController = TextEditingController();
    _isSubmitting = false;
  }

  @override
  void dispose() {
    _priceController.dispose();
    _notesController.dispose();
    _colorTagsController.dispose();
    _designTagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clientsAsync = ref.watch(clientsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Appointment')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              clientsAsync.when(
                data: (clients) {
                  return DropdownButtonFormField<String>(
                    initialValue: _selectedClientId,
                    decoration: const InputDecoration(labelText: 'Client *'),
                    items: clients.map((client) {
                      return DropdownMenuItem(
                        value: client.id,
                        child: Text('${client.firstName} ${client.lastName}'),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => _selectedClientId = value),
                    validator: (value) => value == null ? 'Select a client' : null,
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Text('Error loading clients: $error'),
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(_selectedDate != null ? _selectedDate.toString().split(' ')[0] : 'Select Date *'),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    setState(() => _selectedDate = date);
                  }
                },
              ),
              if (_selectedDate != null)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(_selectedTime != null
                      ? _selectedTime!.format(context)
                      : 'Select Time *'),
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setState(() => _selectedTime = time);
                    }
                  },
                ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                initialValue: _durationMinutes,
                decoration: const InputDecoration(labelText: 'Duration'),
                items: [30, 60, 90, 120].map((duration) {
                  return DropdownMenuItem(
                    value: duration,
                    child: Text('$duration minutes'),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _durationMinutes = value ?? 60),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _selectedShape,
                decoration: const InputDecoration(labelText: 'Nail Shape'),
                items: _shapes.map((shape) {
                  return DropdownMenuItem(value: shape, child: Text(shape));
                }).toList(),
                onChanged: (value) => setState(() => _selectedShape = value),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _selectedLength,
                decoration: const InputDecoration(labelText: 'Length'),
                items: _lengths.map((length) {
                  return DropdownMenuItem(value: length, child: Text(length));
                }).toList(),
                onChanged: (value) => setState(() => _selectedLength = value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _colorTagsController,
                decoration: const InputDecoration(labelText: 'Colors (comma-separated)'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _designTagsController,
                decoration: const InputDecoration(labelText: 'Designs (comma-separated)'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes'),
                maxLines: 3,
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                label: _isSubmitting ? 'Creating...' : 'Create Appointment',
                onPressed: _isSubmitting ? () {} : () {},
                icon: Icons.calendar_today,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
