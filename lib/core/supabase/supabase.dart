import 'package:supabase_flutter/supabase_flutter.dart';

import '../value_objects/uuid.dart';

export 'supabase_client.dart';
export 'supabase_container.dart';

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
