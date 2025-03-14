import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../core.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile implements OfflineFirstEntity {
  const Profile._();

  const factory Profile({
    required Uuid id,
    required String userId,
    String? name,
    required String email,
    String? avatarUrl,
    required DateTime updatedAt,
  }) = _Profile;

  @override
  Profile copyWithUpdatedAt(DateTime updatedAt) {
    return copyWith(updatedAt: updatedAt);
  }
}
