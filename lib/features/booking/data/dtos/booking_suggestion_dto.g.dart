// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_suggestion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingSuggestionDtoImpl _$$BookingSuggestionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingSuggestionDtoImpl(
      suggestion: json['suggestion'] as String,
      categoryType: const CategoryTypeSerializer()
          .fromJson(json['category_type'] as String),
    );

Map<String, dynamic> _$$BookingSuggestionDtoImplToJson(
        _$BookingSuggestionDtoImpl instance) =>
    <String, dynamic>{
      'suggestion': instance.suggestion,
      'category_type':
          const CategoryTypeSerializer().toJson(instance.categoryType),
    };
