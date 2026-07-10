import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result.freezed.dart';

enum SearchResultType { client, appointment, photo }

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required String id,
    required SearchResultType type,
    required String title,
    String? subtitle,
    String? imageUrl,
  }) = _SearchResult;
}
