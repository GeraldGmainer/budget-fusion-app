import 'package:freezed_annotation/freezed_annotation.dart';

import '../core.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const Category._();

  const factory Category({
    required int id,
    required String name,
    required CategoryType categoryType,
    required String iconName,
    required String iconColor,
  }) = _Category;
}
