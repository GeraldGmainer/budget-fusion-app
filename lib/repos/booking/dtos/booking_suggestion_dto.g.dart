// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_suggestion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingSuggestionDto _$BookingSuggestionDtoFromJson(
  Map<String, dynamic> json,
) => _BookingSuggestionDto(
  suggestion: json['suggestion'] as String,
  categoryType: const CategoryTypeSerializer().fromJson(
    json['category_type'] as String,
  ),
);

Map<String, dynamic> _$BookingSuggestionDtoToJson(
  _BookingSuggestionDto instance,
) => <String, dynamic>{
  'suggestion': instance.suggestion,
  'category_type': const CategoryTypeSerializer().toJson(instance.categoryType),
};
