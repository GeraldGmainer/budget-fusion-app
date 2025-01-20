import 'package:supabase_flutter/supabase_flutter.dart';

extension SupabaseUserExtension on User {
  String? get profileId {
    final profileIdValue = userMetadata?['profile_id'];
    if (profileIdValue is String) {
      return profileIdValue;
    }
    return null;
  }
}
