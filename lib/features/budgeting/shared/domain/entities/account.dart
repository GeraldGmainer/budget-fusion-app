import 'package:freezed_annotation/freezed_annotation.dart';

import 'entities.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account {
  const Account._();

  const factory Account({
    required int id,
    required String name,
    required String iconName,
    required String iconColor,
  }) = _Account;
}
