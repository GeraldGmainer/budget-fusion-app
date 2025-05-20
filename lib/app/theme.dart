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
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryTextColor),
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
      displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.accentColor),
      displayMedium: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: AppColors.secondaryTextColor),
      displaySmall: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.primaryTextColor),
      bodyMedium: TextStyle(fontSize: 15, color: AppColors.secondaryTextColor),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 13),
      floatingLabelStyle: TextStyle(fontSize: 13, color: AppColors.secondaryTextColor),
      hintStyle: TextStyle(fontSize: 13),
    ),

    cardTheme: CardThemeData(color: AppColors.cardColor, elevation: 4, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primaryTextColor),
        backgroundColor: WidgetStateProperty.all(AppColors.accentColor),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppColors.accentColor, foregroundColor: AppColors.primaryTextColor),

    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(fontSize: 16.0),
      subtitleTextStyle: TextStyle(fontSize: 12.0, color: AppColors.secondaryTextColor),
    ),

    dialogTheme: DialogThemeData(backgroundColor: AppColors.cardColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),

    // :contentReference[oaicite:1]{index=1}
    tabBarTheme: TabBarThemeData(
      indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 3.0, color: AppColors.primaryTextColor)),
      dividerColor: AppColors.secondaryTextColor,
      dividerHeight: 0.4,
      labelColor: AppColors.primaryTextColor,
      labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.grey),
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
    ),

    popupMenuTheme: PopupMenuThemeData(textStyle: TextStyle(color: AppColors.primaryTextColor)),

    segmentedButtonTheme: SegmentedButtonThemeData(/* … */),

    chipTheme: ChipThemeData(
      brightness: Brightness.dark,
      backgroundColor: AppColors.cardColor.withValues(alpha: 0.12),
      disabledColor: AppColors.cardColor.withValues(alpha: 0.12),
      selectedColor: AppColors.accentColor,
      secondarySelectedColor: AppColors.accentColor,
      labelStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.secondaryTextColor),
      secondaryLabelStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.primaryTextColor),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      side: BorderSide(color: Colors.transparent),
      elevation: 2,
      pressElevation: 6,
      shadowColor: AppColors.accentColor.withValues(alpha: 0.3),
    ),
  );
}
