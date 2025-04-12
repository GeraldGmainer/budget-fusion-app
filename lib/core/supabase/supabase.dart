import 'package:budget_fusion_app/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

export 'supabase_client.dart';
export 'supabase_container.dart';

final supabase = Supabase.instance.client;

get getUserId => Uuid(supabase.auth.currentUser!.id);
