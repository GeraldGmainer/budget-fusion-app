import 'package:logger/logger.dart';

class AppLogColors {
  static final AnsiColor localDataSourceStart = AnsiColor.fg(111);
  static final AnsiColor localDataSourceEnd = AnsiColor.fg(27);

  static final AnsiColor remoteDataSourceStart = AnsiColor.fg(108);
  static final AnsiColor remoteDataSourceEnd = AnsiColor.fg(28);

  static final Map<String, AnsiColor> _domainColors = {
    'profiles': AnsiColor.fg(34), // blue
    'profile_settings': AnsiColor.fg(36), // cyan
    'accounts': AnsiColor.fg(32), // green
    'categories': AnsiColor.fg(33), // yellow
    'bookings': AnsiColor.fg(35), // magenta
  };

  static AnsiColor getDomainColor(String table) {
    return _domainColors[table] ?? AnsiColor.fg(30);
  }

  static String applyColor(String table) {
    return getDomainColor(table)(table);
  }
}
