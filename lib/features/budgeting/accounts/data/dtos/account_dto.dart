import 'package:budget_fusion_app/features/budgeting/shared/shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_dto.freezed.dart';
part 'account_dto.g.dart';

@freezed
class AccountDto with _$AccountDto {
  const AccountDto._();

  const factory AccountDto({
    required int id,
    required String name,
    @JsonKey(name: 'icon_name') required String iconName,
    @JsonKey(name: 'icon_color') required String iconColor,
  }) = _AccountDto;

  factory AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);

  Account toDomain() {
    return Account(
      id: id,
      name: name,
      iconName: iconName,
      iconColor: iconColor,
    );
  }
}
