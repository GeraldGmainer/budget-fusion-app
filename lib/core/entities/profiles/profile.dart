import 'package:freezed_annotation/freezed_annotation.dart';

import '../base/entity.dart';
import '../base/uuid.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile implements Entity {
  const Profile._();

  const factory Profile({required Uuid id, required String email, String? firstName, String? lastName, String? avatarUrl, required DateTime updatedAt}) =
      _Profile;
}
