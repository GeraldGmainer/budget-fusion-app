import 'package:logger/logger.dart';

class AppLogColors {
  static const int serviceCharLength = 25;

  static final AnsiColor localDataSourceStart = AnsiColor.fg(111);
  static final AnsiColor localDataSourceEnd = AnsiColor.fg(27);

  static final AnsiColor remoteDataSourceStart = AnsiColor.fg(108);
  static final AnsiColor remoteDataSourceEnd = AnsiColor.fg(46);

  static final AnsiColor dataManagerStart = AnsiColor.fg(140);
  static final AnsiColor dataManagerEnd = AnsiColor.fg(54);

  static final AnsiColor realtimeNotifierServiceStart = AnsiColor.fg(95);
  static final AnsiColor realtimeNotifierServiceEnd = AnsiColor.fg(35);

  static final AnsiColor queueLocalDataSource = AnsiColor.fg(96);

  static final Map<String, AnsiColor> _domainColors = {
    'profiles': AnsiColor.fg(34),
    'profile_settings': AnsiColor.fg(42),
    'account': AnsiColor.fg(32),
    'categories': AnsiColor.fg(33),
    'bookings': AnsiColor.fg(35),
  };

  static AnsiColor getDomainColor(String table) {
    return _domainColors[table] ?? AnsiColor.fg(30);
  }

  static String applyColor(String table) {
    return getDomainColor(table)(table);
  }
}
