import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const Profile._();

  const factory Profile({
    required Uuid id,
    required String userId,
    String? name,
    required String email,
    String? avatarUrl,
  }) = _Profile;
}
