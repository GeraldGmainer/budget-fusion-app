import 'package:freezed_annotation/freezed_annotation.dart';

import '../base/entity.dart';
import '../base/uuid.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account implements Entity {
  const Account._();

  const factory Account({
    required Uuid id,
    required Uuid userId,
    required String name,
    required String iconName,
    required String iconColor,
    required DateTime updatedAt,
  }) = _Account;
}
