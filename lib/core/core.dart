import 'package:supabase_flutter/supabase_flutter.dart';

export 'cache/cache.dart';
export 'constants/constants.dart';
export 'di/injection.dart';
export 'domain/domain.dart';
export 'enums/enums.dart';
export 'exceptions/exceptions.dart';
export 'service/service.dart';
export 'supabase/supabase.dart';

final supabase = Supabase.instance.client;
