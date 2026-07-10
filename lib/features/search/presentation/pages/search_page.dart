import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/features/search/domain/models/search_result.dart';
import 'package:nailvault/features/search/presentation/providers/search_provider.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      ref.read(searchQueryProvider.notifier).state = _searchController.text;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resultsAsync = ref.watch(searchResultsProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search clients, appointments, photos...',
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      ref.read(searchQueryProvider.notifier).state = '';
                    },
                  )
                : null,
          ),
          autofocus: true,
        ),
      ),
      body: _searchController.text.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Try searching for a client name, color, or appointment details.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : resultsAsync.when(
              data: (results) {
                if (results.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'No results found for "${_searchController.text}"',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: results.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final result = results[index];
                    return _SearchResultCard(result: result);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('Error: $error')),
            ),
    );
  }
}

class _SearchResultCard extends StatelessWidget {
  const _SearchResultCard({required this.result});

  final SearchResult result;

  @override
  Widget build(BuildContext context) {
    final icon = switch (result.type) {
      SearchResultType.client => Icons.person,
      SearchResultType.appointment => Icons.calendar_today,
      SearchResultType.photo => Icons.photo,
    };

    return GestureDetector(
      onTap: () {
        // Handle navigation based on result type
        switch (result.type) {
          case SearchResultType.client:
            // Will need to fetch client first
            break;
          case SearchResultType.appointment:
            // Navigate to appointment detail
            break;
          case SearchResultType.photo:
            // Show photo detail
            break;
        }
      },
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: Text(result.title),
          subtitle: result.subtitle != null ? Text(result.subtitle!) : null,
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
