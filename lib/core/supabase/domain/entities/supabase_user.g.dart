// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupabaseUserImpl _$$SupabaseUserImplFromJson(Map<String, dynamic> json) =>
    _$SupabaseUserImpl(
      id: json['id'] as String,
      appMetadata: json['appMetadata'] as Map<String, dynamic>,
      userMetadata: json['userMetadata'] as Map<String, dynamic>?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$SupabaseUserImplToJson(_$SupabaseUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appMetadata': instance.appMetadata,
      'userMetadata': instance.userMetadata,
      'email': instance.email,
    };
