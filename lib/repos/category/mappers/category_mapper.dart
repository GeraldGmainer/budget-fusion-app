import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../dtos/category_dto.dart';
import '../entities/category.dart';

@lazySingleton
class CategoryMapper {
  List<Category> fromDtos(List<CategoryDto> dtos) {
    final Map<Uuid, _CategoryBuilder> builderMap = {};
    for (var dto in dtos) {
      builderMap[dto.id] = _CategoryBuilder(
        id: dto.id,
        name: dto.name,
        categoryType: dto.categoryType,
        iconName: dto.iconName,
        iconColor: dto.iconColor,
        parentId: dto.parentId,
        syncStatus: dto.syncStatus,
        createdAt: dto.createdAt,
        updatedAt: dto.updatedAt,
      );
    }
    for (var builder in builderMap.values) {
      if (builder.parentId != null) {
        final parentBuilder = builderMap[builder.parentId];
        if (parentBuilder != null) {
          builder.parentBuilder = parentBuilder;
          parentBuilder.children.add(builder);
        }
      }
    }
    final roots = builderMap.values.where((b) => b.parentBuilder == null);
    final List<Category> initialTrees = [for (var root in roots) _buildWithoutParent(root)];
    final List<Category> finalTrees = [for (var tree in initialTrees) _assignParents(tree, null)];
    return _sortCategories(finalTrees);
  }

  List<Category> _sortCategories(List<Category> categories) {
    final sorted = List<Category>.from(categories)..sort((a, b) {
      final aKey = a.parent?.name ?? a.name;
      final bKey = b.parent?.name ?? b.name;
      final parentCmp = aKey.compareTo(bKey);
      if (parentCmp != 0) return parentCmp;

      return a.name.compareTo(b.name);
    });
    return sorted;
  }

  Category _buildWithoutParent(_CategoryBuilder b) {
    final children = b.children.map(_buildWithoutParent).toList();
    return Category(
      id: b.id,
      name: b.name,
      categoryType: b.categoryType,
      iconName: b.iconName,
      iconColor: b.iconColor,
      parent: null,
      subcategories: children,
      syncStatus: b.syncStatus,
      createdAt: b.createdAt,
      updatedAt: b.updatedAt,
    );
  }

  Category _assignParents(Category node, Category? parent) {
    final updated = node.copyWith(parent: parent, subcategories: []);
    final updatedChildren = node.subcategories.map((child) => _assignParents(child, updated)).toList();
    return updated.copyWith(subcategories: updatedChildren);
  }
}

class _CategoryBuilder {
  final Uuid id;
  final String name;
  final CategoryType categoryType;
  final String iconName;
  final String iconColor;
  final Uuid? parentId;
  _CategoryBuilder? parentBuilder;
  final List<_CategoryBuilder> children = [];
  final SyncStatus? syncStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  _CategoryBuilder({
    required this.id,
    required this.name,
    required this.categoryType,
    required this.iconName,
    required this.iconColor,
    required this.parentId,
    required this.syncStatus,
    required this.createdAt,
    required this.updatedAt,
  });
}
