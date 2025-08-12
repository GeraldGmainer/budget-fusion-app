import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core.dart';
import '../dtos/account_dto.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account implements Entity {
  const Account._();

  const factory Account({
    required Uuid id,
    required String name,
    required String iconName,
    required String iconColor,
    required bool isSynced,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required DateTime? deletedAt,
  }) = _Account;

  factory Account.fromDto(AccountDto dto, {required bool isSynced}) {
    return Account(
      id: dto.id,
      name: dto.name,
      iconName: dto.iconName,
      iconColor: dto.iconColor,
      isSynced: isSynced,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      deletedAt: dto.deletedAt,
    );
  }

  AccountDto toDto() {
    return AccountDto(id: id, name: name, iconName: iconName, iconColor: iconColor, createdAt: createdAt, updatedAt: updatedAt, deletedAt: deletedAt);
  }

  factory Account.notFound() {
    return Account(
      id: Uuid.generate(),
      name: "not found",
      iconName: FeatureConstants.notFoundIconName,
      iconColor: FeatureConstants.notFoundIconColor,
      isSynced: true,
      createdAt: null,
      updatedAt: null,
      deletedAt: null,
    );
  }
}
