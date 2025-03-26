import 'package:budget_fusion_app/utils/utils.dart';
import 'package:logger/logger.dart';

class DomainLogger {
  static const int serviceCharLength = 25;
  static final Map<String, AnsiColor> _domainColors = {
    'profile': AnsiColor.fg(34),
    'profile_setting': AnsiColor.fg(42),
    'account': AnsiColor.fg(32),
    'category': AnsiColor.fg(33),
    'booking': AnsiColor.fg(35),
  };

  static AnsiColor getDomainColor(String table) {
    return _domainColors[table] ?? AnsiColor.fg(30);
  }

  static String applyColor(String table) {
    return getDomainColor(table)(table);
  }

  static final DomainLogger _instance = DomainLogger._();

  DomainLogger._();

  static DomainLogger get instance => _instance;

  void d(String service, String msg, {bool? darkColor}) {
    final color = _determineDomainColor(service, darkColor ?? false);
    final domainText = color("$service:".padRight(serviceCharLength));
    BudgetLogger.instance.d("$domainText $msg", short: true);
  }

  AnsiColor _determineDomainColor(String service, bool darkColor) {
    if (service == "LocalDataSource") {
      return darkColor ? AnsiColor.fg(27) : AnsiColor.fg(111);
    }
    if (service == "RemoteDataSource") {
      return darkColor ? AnsiColor.fg(46) : AnsiColor.fg(108);
    }
    if (service == "DataManager") {
      return darkColor ? AnsiColor.fg(54) : AnsiColor.fg(140);
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

    BudgetLogger.instance.d("unknown service name for logging: $service");

    return AnsiColor.fg(30);
  }
}
