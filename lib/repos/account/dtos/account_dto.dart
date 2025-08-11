import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_dto.freezed.dart';
part 'account_dto.g.dart';

@freezed
class AccountDto with _$AccountDto implements Dto {
  const AccountDto._();

  const factory AccountDto({
    @UuidSerializer() required Uuid id,
    required String name,
    @JsonKey(name: 'icon_name') required String iconName,
    @JsonKey(name: 'icon_color') required String iconColor,
    @DateTimeSerializer() @JsonKey(name: 'created_at') required DateTime? createdAt,
    @DateTimeSerializer() @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @DateTimeSerializer() @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _AccountDto;

  factory AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$$AccountDtoImplToJson(this as _$AccountDtoImpl);
}
