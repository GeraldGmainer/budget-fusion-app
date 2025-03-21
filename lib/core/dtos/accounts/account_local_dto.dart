import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_local_dto.freezed.dart';

@freezed
class AccountLocalDto with _$AccountLocalDto implements OfflineFirstLocalDto {
  const AccountLocalDto._();

  const factory AccountLocalDto({
    required String id,
    required String name,
    required String iconName,
    required String iconColor,
    required DateTime updatedAt,
  }) = _AccountLocalDto;

  factory AccountLocalDto.fromMap(Map<String, Object?> row) {
    return AccountLocalDto(
      id: row['id'] as String,
      name: row['name'] as String,
      iconName: row['icon_name'] as String,
      iconColor: row['icon_color'] as String,
      updatedAt: DateTime.parse(row['updated_at'] as String),
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'icon_name': iconName,
      'icon_color': iconColor,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Account toDomain() {
    return Account(
      id: Uuid(id),
      name: name,
      iconName: iconName,
      iconColor: iconColor,
    );
  }
}
