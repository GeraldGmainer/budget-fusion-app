import 'package:freezed_annotation/freezed_annotation.dart';

import '../base/entity.dart';
import '../base/uuid.dart';

part 'currency.freezed.dart';

@freezed
class Currency with _$Currency implements Entity {
  const Currency._();

  const factory Currency({
    required Uuid id,
    required String name,
    required int decimalPrecision,
    required bool unitPositionFront,
    required String symbol,
    int? uiOrder,
  }) = _Currency;
}
