import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const Category._();

  const factory Category({
    required Uuid id,
    required String name,
    required CategoryType categoryType,
    required String iconName,
    required String iconColor,
  }) = _Category;

  // TODO better detect fallback
  static fallback() {
    return Category(
      id: Uuid.generate(),
      name: 'Unknown',
      categoryType: CategoryType.outcome,
      iconName: 'lightbulb-outline',
      iconColor: '#808080',
    );
  }
}
