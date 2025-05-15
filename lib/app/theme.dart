import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/core.dart';

ThemeData createTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.primaryColor,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.accentColor,
      onPrimary: AppColors.primaryTextColor,
      secondary: AppColors.accentColor,
      onSecondary: AppColors.secondaryTextColor,
      error: AppColors.errorColor,
      onError: Colors.white,
      surface: AppColors.primaryColor,
      onSurface: AppColors.primaryTextColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryTextColor,
      ),
      iconTheme: IconThemeData(color: AppColors.primaryTextColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      selectedItemColor: AppColors.accentColor,
      unselectedItemColor: AppColors.secondaryTextColor,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.accentColor,
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryTextColor,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontStyle: FontStyle.italic,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.primaryTextColor,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.normal,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 13),
      floatingLabelStyle: TextStyle(fontSize: 13, color: AppColors.secondaryTextColor),
      hintStyle: TextStyle(fontSize: 13),
    ),
    cardTheme: CardTheme(
      color: AppColors.cardColor,
      // shadowColor: AppColors.accentColor.withOpacity(0.3),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primaryTextColor),
        backgroundColor: WidgetStateProperty.all(AppColors.accentColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.accentColor,
      foregroundColor: AppColors.primaryTextColor,
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(fontSize: 16.0),
      subtitleTextStyle: TextStyle(fontSize: 12.0, color: AppColors.secondaryTextColor),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 3.0, color: AppColors.primaryTextColor)),
      dividerColor: AppColors.secondaryTextColor,
      dividerHeight: 0.4,
      labelColor: AppColors.primaryTextColor,
      labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.grey),
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
    ),
    popupMenuTheme: PopupMenuThemeData(
      textStyle: TextStyle(color: AppColors.primaryTextColor),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(4),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        side: WidgetStateProperty.resolveWith<BorderSide?>((Set<WidgetState> states) {
          return BorderSide(color: Colors.transparent);
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) return null;
          if (states.contains(WidgetState.selected)) return AppColors.accentColor;
          return AppColors.cardColor;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) return null;
          if (states.contains(WidgetState.selected)) return AppColors.primaryTextColor;
          return AppColors.secondaryTextColor;
        }),
        iconColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) return null;
          if (states.contains(WidgetState.selected)) return AppColors.primaryTextColor;
          return AppColors.secondaryTextColor;
        }),
        padding: WidgetStatePropertyAll(const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0)),
        textStyle: WidgetStateProperty.resolveWith<TextStyle?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) return GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
          return GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
        }),
      ),
    ),
  );
}
