import 'package:freezed_annotation/freezed_annotation.dart';

part 'pie_data.freezed.dart';

@freezed
class PieData with _$PieData {
  const PieData._();

  const factory PieData({
    required String xData,
    required num yData,
    String? text,
    required String iconName,
    required String iconColor,
    required bool hideIcon,
  }) = _PieData;
}
