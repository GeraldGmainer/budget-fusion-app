import 'package:freezed_annotation/freezed_annotation.dart';

import '../base/entity.dart';
import '../base/uuid.dart';
import 'currency.dart';

part 'profile_setting.freezed.dart';

@freezed
class ProfileSetting with _$ProfileSetting implements Entity {
  const ProfileSetting._();

  const factory ProfileSetting({required Uuid id, required Currency currency, required DateTime updatedAt}) = _ProfileSetting;
}
