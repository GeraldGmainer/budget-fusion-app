import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/profile_dto.dart';

@lazySingleton
class ProfileRemoteDataSource extends OfflineFirstRemoteDataSource<ProfileDto> {
  @override
  String get table => 'profile';

  @override
  String get columns => 'id, first_name, last_name, avatar_url, updated_at';

  @override
  ProfileDto toDto(Map<String, dynamic> json) {
    return ProfileDto.fromJson(json);
  }
}
