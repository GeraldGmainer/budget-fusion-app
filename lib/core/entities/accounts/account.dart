import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account {
  const Account._();

  const factory Account({
    required Uuid id,
    required Uuid userId,
    required String name,
    required String iconName,
    required String iconColor,
    required DateTime updatedAt,
  }) = _Account;

// @override
// Profile copyWithUpdatedAt(DateTime updatedAt) {
//   return copyWith(updatedAt: updatedAt);
// }
}
