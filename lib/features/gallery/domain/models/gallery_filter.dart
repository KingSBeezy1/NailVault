import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_filter.freezed.dart';

@freezed
class GalleryFilter with _$GalleryFilter {
  const factory GalleryFilter({
    String? color,
    String? shape,
    String? length,
    String? clientId,
    DateTime? dateFrom,
    DateTime? dateTo,
    @Default(false) bool favoritesOnly,
    @Default(false) bool postedOnly,
  }) = _GalleryFilter;
}
