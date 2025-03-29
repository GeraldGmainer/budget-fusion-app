import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const Category._();

  const factory Category({
    required Uuid id,
    required Uuid userId,
    required String name,
    required CategoryType categoryType,
    required String iconName,
    required String iconColor,
    required Category? parent,
    required DateTime updatedAt,
  }) = _Category;

  bool get isParent => parent == null;
}
