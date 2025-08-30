import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core.dart';
import '../dtos/account_dto.dart';

part 'account.freezed.dart';

@freezed
abstract class Account with _$Account, Entity {
  const Account._();

  const factory Account({
    required Uuid id,
    required String name,
    required String iconName,
    required String iconColor,
    SyncStatus? syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) = _Account;

  factory Account.fromDto(AccountDto dto) {
    return Account(
      id: dto.id,
      name: dto.name,
      iconName: dto.iconName,
      iconColor: dto.iconColor,
      syncStatus: dto.syncStatus,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      deletedAt: dto.deletedAt,
    );
  }

  AccountDto toDto() {
    return AccountDto(id: id, name: name, iconName: iconName, iconColor: iconColor, syncStatus: syncStatus, createdAt: createdAt, updatedAt: updatedAt, deletedAt: deletedAt);
  }

  factory Account.notFound() {
    return Account(
      id: Uuid.generate(),
      name: "not found",
      iconName: FeatureConstants.notFoundIconName,
      iconColor: FeatureConstants.notFoundIconColor,
    );
  }
}
