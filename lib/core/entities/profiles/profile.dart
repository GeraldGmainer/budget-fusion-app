import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/utils.dart';
import '../base/entity.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile implements Entity {
  const Profile._();

  const factory Profile({
    required Uuid id,
    required Uuid userId,
    String? name,
    required String email,
    String? avatarUrl,
    required DateTime updatedAt,
  }) = _Profile;
}
