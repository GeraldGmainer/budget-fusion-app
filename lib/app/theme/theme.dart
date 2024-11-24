import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/constants.dart';

ThemeData createTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.primaryColor,
    // Ensures the scaffold has the primary color
    // backgroundColor: AppColors.primaryColor,

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryTextColor,
      ),
      iconTheme: IconThemeData(color: AppColors.primaryTextColor),
    ),

    // TabBar Theme
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.symmetric(vertical: 8),
      labelColor: AppColors.accentColor,
      unselectedLabelColor: AppColors.secondaryTextColor,
      indicator: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.accentColor, width: 4.0)),
      ),
    ),

    // BottomNavigationBar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      selectedItemColor: AppColors.accentColor,
      unselectedItemColor: AppColors.secondaryTextColor,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),

    // Text Theme
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

    // Card Theme
    cardTheme: CardTheme(
      color: AppColors.cardColor,
      // shadowColor: AppColors.accentColor.withOpacity(0.3),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // ElevatedButton Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.primaryTextColor),
        backgroundColor: MaterialStateProperty.all(AppColors.accentColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),

    // FloatingActionButton Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.accentColor,
      foregroundColor: AppColors.primaryTextColor,
    ),

    // Additional Theme Properties as Needed
  );
}

// ThemeData _createTheme(BuildContext context) {
//   return ThemeData(
//     brightness: Brightness.dark,
//     // fontFamily: GoogleFonts.raleway().fontFamily,
//     fontFamily: GoogleFonts.poppins().fontFamily,
//     // fontFamily: GoogleFonts.notoSans().fontFamily,
//     // fontFamily: GoogleFonts.arimo().fontFamily,
//     primaryColor: AppColors.accentColor,
//     tabBarTheme: TabBarTheme(
//       labelPadding: EdgeInsets.symmetric(vertical: 8),
//       indicator: BoxDecoration(
//         border: Border(bottom: BorderSide(color: AppColors.accentColor, width: 4.0)),
//       ),
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       selectedItemColor: AppColors.accentColor,
//       unselectedItemColor: AppColors.secondaryTextColor,
//     ),
//     textTheme: const TextTheme(
//       displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.accentColor),
//       displayMedium: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: AppColors.secondaryTextColor),
//       displaySmall: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//       bodyLarge: TextStyle(fontSize: 16, color: AppColors.primaryTextColor, fontWeight: FontWeight.normal),
//       bodyMedium: TextStyle(fontSize: 15, color: AppColors.secondaryTextColor, fontWeight: FontWeight.normal),
//     ),
//     cardTheme: CardTheme(color: AppColors.cardColor),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.accentColor, foregroundColor: AppColors.primaryTextColor),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ButtonStyle(
//         foregroundColor: WidgetStateProperty.all(AppColors.primaryTextColor),
//         backgroundColor: WidgetStateProperty.all(AppColors.secondaryColor),
//       ),
//     ),
//   );
// }
