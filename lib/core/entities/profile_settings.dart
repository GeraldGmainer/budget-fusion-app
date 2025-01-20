import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import 'currency.dart';

part 'profile_settings.freezed.dart';

@freezed
class ProfileSettings with _$ProfileSettings {
  const ProfileSettings._();

  const factory ProfileSettings({
    required Uuid id,
    required Uuid profileId,
    required Currency currency,
  }) = _ProfileSettings;
}
