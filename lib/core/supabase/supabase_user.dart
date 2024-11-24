import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_user.freezed.dart';
part 'supabase_user.g.dart';

@freezed
class SupabaseUser with _$SupabaseUser {
  const SupabaseUser._();

  const factory SupabaseUser({
    required String id,
    required Map<String, dynamic> appMetadata,
    required Map<String, dynamic>? userMetadata,
    String? email,
  }) = _SupabaseUser;

  factory SupabaseUser.fromJson(Map<String, dynamic> json) => _$SupabaseUserFromJson(json);

  factory SupabaseUser.fromGoTrueUser(User user) {
    return SupabaseUser(
      id: user.id,
      appMetadata: user.appMetadata,
      userMetadata: user.userMetadata,
      email: user.email,
    );
  }

  int? get profileId {
    final profileIdValue = userMetadata?['profile_id'];
    if (profileIdValue is int) {
      return profileIdValue;
    } else if (profileIdValue is String) {
      return int.tryParse(profileIdValue);
    }
    return null;
  }
}
