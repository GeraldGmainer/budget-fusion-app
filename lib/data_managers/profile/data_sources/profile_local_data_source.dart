import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/profile_dto.dart';

@lazySingleton
class ProfileLocalDataSource extends LocalDataSource<ProfileDto> {
  ProfileLocalDataSource(super.db);

  @override
  String get table => "profile";

  @override
  String? get defaultOrderBy => "id ASC";

  @override
  ProfileDto fromJson(Map<String, dynamic> json) => ProfileDto.fromJson(json);
}
