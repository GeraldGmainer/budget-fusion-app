import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';

@lazySingleton
class CategoryRemoteSource extends SupabaseClient {
  Future<List<CategoryDto>> fetchAllCategories() async {
    return execute("fetchAllCategories", () async {
      final response = await supabase.from('categories').select('id, name, icon_name, icon_color, category_type').order('name', ascending: true);
      return List.from(response).map((item) => CategoryDto.fromJson(item)).toList();
    });
  }
}
