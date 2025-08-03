import 'package:budget_fusion_app/utils/utils.dart';
import 'package:logger/logger.dart';

class EntityLogger {
  static const int serviceCharLength = 25;
  static const int entityCharLength = 20;
  static final Map<String, AnsiColor> _entityColors = {
    'queue': AnsiColor.fg(250),
    'realtime': AnsiColor.fg(250),
    'profile': AnsiColor.fg(34),
    'profile_setting': AnsiColor.fg(35),
    'account': AnsiColor.fg(32),
    'category': AnsiColor.fg(214),
    'booking': AnsiColor.fg(133),
    'currency': AnsiColor.fg(220),
  };

  static AnsiColor getEntityColor(String table) {
    return _entityColors[table] ?? AnsiColor.fg(30);
  }

  static String applyColor(String table) {
    return getEntityColor(table)(table);
  }

  static String bold(Object v) => AnsiColor.fg(208)(v.toString());

  static final EntityLogger _instance = EntityLogger._();

  EntityLogger._();

  static EntityLogger get instance => _instance;

  void d(String service, String entity, String msg, {bool? darkColor}) {
    final serviceColor = _determineServiceColor(service, darkColor ?? false);
    final entityColor = getEntityColor(entity);
    final serviceText = serviceColor(service.padRight(serviceCharLength));
    final entityText = entityColor(entity.padRight(entityCharLength));
    BudgetLogger.instance.d("$serviceText $entityText $msg", short: true);
  }

  AnsiColor _determineServiceColor(String service, bool darkColor) {
    if (service == "LocalDataSource") {
      return darkColor ? AnsiColor.fg(27) : AnsiColor.fg(111);
    }
    if (service == "RemoteDataSource") {
      return darkColor ? AnsiColor.fg(46) : AnsiColor.fg(108);
    }
    if (service == "DataManager") {
      return darkColor ? AnsiColor.fg(92) : AnsiColor.fg(140);
    }
    if (service == "RealtimeNotifier") {
      return darkColor ? AnsiColor.fg(35) : AnsiColor.fg(95);
    }
    if (service == "QueueDataSource") {
      return AnsiColor.fg(96);
    }
    if (service == "QueueManager") {
      return AnsiColor.fg(51);
    }
    if (service.contains("Cubit")) {
      return darkColor ? AnsiColor.fg(208) : AnsiColor.fg(136);
    }

    BudgetLogger.instance.d("unknown service name for logging: $service");

    return AnsiColor.fg(30);
  }
}
