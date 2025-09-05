import 'package:supabase_flutter/supabase_flutter.dart';

import '../../utils/utils.dart';
import '../exceptions/unauthenticated_exception.dart';
import '../value_objects/uuid.dart';

export 'supabase_client.dart';

final supabase = Supabase.instance.client;

extension SupabaseUserProfile on User? {
  Uuid? get profileId {
    if (this?.userMetadata?['profile_id'] == null) {
      return null;
    }
    return Uuid(this!.userMetadata!['profile_id'] as String);
  }

  Uuid? get tenantId {
    if (this?.userMetadata?['tenant_id'] == null) {
      return null;
    }
    return Uuid(this!.userMetadata!['tenant_id'] as String);
  }
}

extension SupabaseClientX on SupabaseClient {
  Future<void> refreshToken() async {
    try {
      if (supabase.auth.currentUser == null || supabase.auth.currentSession == null) {
        throw UnauthenticatedException();
      }
      Session session = supabase.auth.currentSession!;
      if ((session.expiresAt! - 5) < (DateTime.now().millisecondsSinceEpoch / 1000).round()) {
        BudgetLogger.instance.i("REFRESH TOKEN");
        await supabase.auth.refreshSession();
      }
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Error refreshing session", e, stackTrace);
    }
  }
}
