// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pie_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PieData {
  String get xData => throw _privateConstructorUsedError;
  num get yData => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;
  String get iconColor => throw _privateConstructorUsedError;
  bool get hideIcon => throw _privateConstructorUsedError;

  /// Create a copy of PieData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PieDataCopyWith<PieData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieDataCopyWith<$Res> {
  factory $PieDataCopyWith(PieData value, $Res Function(PieData) then) =
      _$PieDataCopyWithImpl<$Res, PieData>;
  @useResult
  $Res call({
    String xData,
    num yData,
    String? text,
    String iconName,
    String iconColor,
    bool hideIcon,
  });
}

/// @nodoc
class _$PieDataCopyWithImpl<$Res, $Val extends PieData>
    implements $PieDataCopyWith<$Res> {
  _$PieDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PieData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xData = null,
    Object? yData = null,
    Object? text = freezed,
    Object? iconName = null,
    Object? iconColor = null,
    Object? hideIcon = null,
  }) {
    return _then(
      _value.copyWith(
            xData:
                null == xData
                    ? _value.xData
                    : xData // ignore: cast_nullable_to_non_nullable
                        as String,
            yData:
                null == yData
                    ? _value.yData
                    : yData // ignore: cast_nullable_to_non_nullable
                        as num,
            text:
                freezed == text
                    ? _value.text
                    : text // ignore: cast_nullable_to_non_nullable
                        as String?,
            iconName:
                null == iconName
                    ? _value.iconName
                    : iconName // ignore: cast_nullable_to_non_nullable
                        as String,
            iconColor:
                null == iconColor
                    ? _value.iconColor
                    : iconColor // ignore: cast_nullable_to_non_nullable
                        as String,
            hideIcon:
                null == hideIcon
                    ? _value.hideIcon
                    : hideIcon // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PieDataImplCopyWith<$Res> implements $PieDataCopyWith<$Res> {
  factory _$$PieDataImplCopyWith(
    _$PieDataImpl value,
    $Res Function(_$PieDataImpl) then,
  ) = __$$PieDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String xData,
    num yData,
    String? text,
    String iconName,
    String iconColor,
    bool hideIcon,
  });
}

/// @nodoc
class __$$PieDataImplCopyWithImpl<$Res>
    extends _$PieDataCopyWithImpl<$Res, _$PieDataImpl>
    implements _$$PieDataImplCopyWith<$Res> {
  __$$PieDataImplCopyWithImpl(
    _$PieDataImpl _value,
    $Res Function(_$PieDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PieData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xData = null,
    Object? yData = null,
    Object? text = freezed,
    Object? iconName = null,
    Object? iconColor = null,
    Object? hideIcon = null,
  }) {
    return _then(
      _$PieDataImpl(
        xData:
            null == xData
                ? _value.xData
                : xData // ignore: cast_nullable_to_non_nullable
                    as String,
        yData:
            null == yData
                ? _value.yData
                : yData // ignore: cast_nullable_to_non_nullable
                    as num,
        text:
            freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                    as String?,
        iconName:
            null == iconName
                ? _value.iconName
                : iconName // ignore: cast_nullable_to_non_nullable
                    as String,
        iconColor:
            null == iconColor
                ? _value.iconColor
                : iconColor // ignore: cast_nullable_to_non_nullable
                    as String,
        hideIcon:
            null == hideIcon
                ? _value.hideIcon
                : hideIcon // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$PieDataImpl extends _PieData {
  const _$PieDataImpl({
    required this.xData,
    required this.yData,
    this.text,
    required this.iconName,
    required this.iconColor,
    required this.hideIcon,
  }) : super._();

  @override
  final String xData;
  @override
  final num yData;
  @override
  final String? text;
  @override
  final String iconName;
  @override
  final String iconColor;
  @override
  final bool hideIcon;

  @override
  String toString() {
    return 'PieData(xData: $xData, yData: $yData, text: $text, iconName: $iconName, iconColor: $iconColor, hideIcon: $hideIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PieDataImpl &&
            (identical(other.xData, xData) || other.xData == xData) &&
            (identical(other.yData, yData) || other.yData == yData) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.hideIcon, hideIcon) ||
                other.hideIcon == hideIcon));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    xData,
    yData,
    text,
    iconName,
    iconColor,
    hideIcon,
  );

  /// Create a copy of PieData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PieDataImplCopyWith<_$PieDataImpl> get copyWith =>
      __$$PieDataImplCopyWithImpl<_$PieDataImpl>(this, _$identity);
}

abstract class _PieData extends PieData {
  const factory _PieData({
    required final String xData,
    required final num yData,
    final String? text,
    required final String iconName,
    required final String iconColor,
    required final bool hideIcon,
  }) = _$PieDataImpl;
  const _PieData._() : super._();

  @override
  String get xData;
  @override
  num get yData;
  @override
  String? get text;
  @override
  String get iconName;
  @override
  String get iconColor;
  @override
  bool get hideIcon;

  /// Create a copy of PieData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PieDataImplCopyWith<_$PieDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
