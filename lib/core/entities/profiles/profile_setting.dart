import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import 'currency.dart';

part 'profile_setting.freezed.dart';

@freezed
class ProfileSetting with _$ProfileSetting {
  const ProfileSetting._();

  const factory ProfileSetting({
    required Uuid id,
    required Uuid userId,
    required Currency currency,
    required DateTime updatedAt,
  }) = _ProfileSetting;

// @override
// Profile copyWithUpdatedAt(DateTime updatedAt) {
//   return copyWith(updatedAt: updatedAt);
// }
}
