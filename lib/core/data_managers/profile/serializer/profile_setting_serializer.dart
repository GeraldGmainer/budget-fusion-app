import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../dtos/profile_setting_dto.dart';

class ProfileSettingDtoConverter implements JsonConverter<ProfileSettingDto, Object?> {
  const ProfileSettingDtoConverter();

  @override
  ProfileSettingDto fromJson(Object? json) {
    if (json is String) {
      return ProfileSettingDto.fromJson(jsonDecode(json) as Map<String, dynamic>);
    }
    if (json is Map<String, dynamic>) {
      return ProfileSettingDto.fromJson(json);
    }
    throw ArgumentError('Invalid JSON for ProfileSettingDto: $json');
  }

  @override
  Object toJson(ProfileSettingDto dto) => jsonEncode(dto.toJson());
}
