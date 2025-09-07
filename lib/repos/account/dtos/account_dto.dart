import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_dto.freezed.dart';
part 'account_dto.g.dart';

@freezed
abstract class AccountDto with _$AccountDto implements Dto {
  const AccountDto._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AccountDto({
    @UuidSerializer() required Uuid id,
    required String name,
    required String iconName,
    required String iconColor,
    @SyncStatusSerializer() required SyncStatus? syncStatus,
    @DateTimeSerializer() required DateTime? createdAt,
    @DateTimeSerializer() required DateTime? updatedAt,
    @DateTimeSerializer() required DateTime? deletedAt,
  }) = _AccountDto;

  factory AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);
}
