import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/features/gallery/domain/models/gallery_filter.dart';
import 'package:nailvault/features/gallery/presentation/providers/gallery_provider.dart';

class GalleryPage extends ConsumerStatefulWidget {
  const GalleryPage({super.key});

  @override
  ConsumerState<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends ConsumerState<GalleryPage> {
  final _queryController = TextEditingController();
  bool _showFilters = false;
  String? _selectedColor;
  String? _selectedShape;
  String? _selectedLength;
  bool _favoritesOnly = false;

  final _colors = ['Pink', 'Red', 'Chrome', 'White', 'Nude', 'Blue', 'Purple', 'Green'];
  final _shapes = ['Square', 'Round', 'Almond', 'Oval', 'Coffin', 'Stiletto'];
  final _lengths = ['Short', 'Medium', 'Long', 'Extra Long'];

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  void _resetFilters() {
    setState(() {
      _selectedColor = null;
      _selectedShape = null;
      _selectedLength = null;
      _favoritesOnly = false;
    });
    ref.read(galleryFilterProvider.notifier).state = const GalleryFilter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _queryController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search pink chrome, almond, floral...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _showFilters = !_showFilters;
                    });
                  },
                  icon: Icon(_showFilters ? Icons.filter_list_off : Icons.filter_list),
                )
              ],
            ),
          ),
          if (_showFilters)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FilterChips(
                    label: 'Colors',
                    options: _colors,
                    selected: _selectedColor,
                    onSelected: (value) => setState(() => _selectedColor = value),
                  ),
                  const SizedBox(height: 12),
                  _FilterChips(
                    label: 'Shapes',
                    options: _shapes,
                    selected: _selectedShape,
                    onSelected: (value) => setState(() => _selectedShape = value),
                  ),
                  const SizedBox(height: 12),
                  _FilterChips(
                    label: 'Lengths',
                    options: _lengths,
                    selected: _selectedLength,
                    onSelected: (value) => setState(() => _selectedLength = value),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _favoritesOnly,
                            onChanged: (value) {
                              setState(() => _favoritesOnly = value ?? false);
                            },
                          ),
                          const Text('Favorites Only'),
                        ],
                      ),
                      FilledButton.tonal(
                        onPressed: _resetFilters,
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.35),
                                  Theme.of(context).colorScheme.secondary.withValues(alpha: 0.9),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Pink chrome',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Client • 2 days ago',
                          style: Theme.of(context).textTheme.bodySmall,
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
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips({
    required this.label,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final List<String> options;
  final String? selected;
  final Function(String?) onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            FilterChip(
              label: const Text('All'),
              selected: selected == null,
              onSelected: (value) => onSelected(null),
            ),
            ...options.map(
              (option) => FilterChip(
                label: Text(option),
                selected: selected == option,
                onSelected: (value) => onSelected(value ? option : null),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
