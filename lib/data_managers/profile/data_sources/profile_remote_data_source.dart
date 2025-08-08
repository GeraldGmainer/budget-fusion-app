import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/profile_dto.dart';

@lazySingleton
class ProfileRemoteDataSource extends RemoteDataSource<ProfileDto> {
  @override
  String get table => 'profile';

  @override
  String get columns => 'id, first_name, last_name, avatar_url, settings, updated_at';

  @override
  ProfileDto toDto(Map<String, dynamic> json) {
    return ProfileDto.fromJson(json);
  }
}
