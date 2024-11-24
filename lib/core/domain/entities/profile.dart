import 'package:freezed_annotation/freezed_annotation.dart';

import 'profile_settings.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const Profile._();

  const factory Profile({
    required int id,
    required String userId,
    String? name,
    String? email,
    String? avatarUrl,
    required ProfileSettings settings,
  }) = _Profile;
}
