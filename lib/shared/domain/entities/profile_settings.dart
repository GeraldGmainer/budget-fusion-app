import 'package:freezed_annotation/freezed_annotation.dart';

import 'currency.dart';

part 'profile_settings.freezed.dart';

@freezed
class ProfileSettings with _$ProfileSettings {
  const ProfileSettings._();

  const factory ProfileSettings({
    required int id,
    required int profileId,
    required Currency currency,
  }) = _ProfileSettings;
}
