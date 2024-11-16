import 'package:supabase_flutter/supabase_flutter.dart';

export 'cache/cache.dart';
export 'constants/constants.dart';
export 'di/bloc_providers.dart';
export 'di/injection.dart';
export 'exceptions/exceptions.dart';
export 'router/app_router.dart';
export 'service/service.dart';
export 'supabase/supabase.dart';

final supabase = Supabase.instance.client;
