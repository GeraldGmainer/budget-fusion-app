import 'package:supabase_flutter/supabase_flutter.dart';

import '../value_objects/uuid.dart';

class UserContext {
  final Uuid userId;
  final Uuid tenantId;
  final Uuid profileId;

  const UserContext({required this.userId, required this.tenantId, required this.profileId});

  Map<String, dynamic> get profileFilter => {'tenant_id': tenantId.value, 'profile_id': profileId.value};

  Map<String, dynamic> get userFilter => {'tenant_id': tenantId.value, 'user_id': userId.value};
}

extension SupabaseUserContext on User {
  UserContext get userContext {
    final uid = Uuid(id);
    final tenantId = Uuid(userMetadata?['tenant_id']);
    final profileId = Uuid(userMetadata?['profile_id']);
    return UserContext(userId: uid, tenantId: tenantId, profileId: profileId);
  }
}
