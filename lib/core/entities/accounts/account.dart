import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account {
  const Account._();

  const factory Account({
    required Uuid id,
    required String name,
    required String iconName,
    required String iconColor,
  }) = _Account;

  // TODO better detect fallback
  static fallback() {
    return Account(
      id: Uuid.generate(),
      name: 'Unknown',
      iconName: 'lightbulb-outline',
      iconColor: '#808080',
    );
  }
}
