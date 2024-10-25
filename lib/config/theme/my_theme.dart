import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/data/local/my_shared_pref.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_styles.dart';

class MyTheme {
 static getThemeData({required bool isLight}){
  return ThemeData(
    primarySwatch: Colors.blue,
    useMaterial3: true,
    // Main color (app bar, tabs, etc)
    primaryColor: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
    
    // Secondary color (for checkbox, floating button, radio, etc)
    colorScheme: ColorScheme.fromSwatch(
      accentColor: isLight ? LightThemeColors.accentColor : DarkThemeColors.accentColor,
      backgroundColor: isLight ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor,
      brightness: isLight ? Brightness.light : Brightness.dark,
    ).copyWith(
      surface: isLight ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor,
      primary: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
      secondary: isLight ? LightThemeColors.accentColor : DarkThemeColors.accentColor,
    ),
    
    // Color contrast
    brightness: isLight ? Brightness.light : Brightness.dark,
    
    // Card widget background color
    cardColor: isLight ? LightThemeColors.cardColor : DarkThemeColors.cardColor,
    
    // Hint text color
    hintColor: isLight ? LightThemeColors.hintTextColor : DarkThemeColors.hintTextColor,
    
    // Divider color
    dividerTheme: DividerThemeData(
      color: isLight ? LightThemeColors.dividerColor : DarkThemeColors.dividerColor,
    ),
    
    // App background color
    scaffoldBackgroundColor: isLight ? LightThemeColors.scaffoldBackgroundColor : DarkThemeColors.scaffoldBackgroundColor,
    
    // Progress bar theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
    ),
    
    // AppBar theme
    appBarTheme: MyStyles.getAppBarTheme(isLightTheme: isLight),
    
    // Elevated button theme
    elevatedButtonTheme: MyStyles.getElevatedButtonTheme(isLightTheme: isLight),
    
    // Text theme
    textTheme: MyStyles.getTextTheme(isLightTheme: isLight),
    
    // Chip theme
    chipTheme: MyStyles.getChipTheme(isLightTheme: isLight),
    
    // Icon theme
    iconTheme: MyStyles.getIconTheme(isLightTheme: isLight),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: isLight ?  LightThemeColors.accentColor : DarkThemeColors.accentColor,  // Global cursor color
      selectionColor: isLight ? LightThemeColors.accentColor : DarkThemeColors.accentColor, // Text selection color
      selectionHandleColor: isLight ? LightThemeColors.accentColor : DarkThemeColors.accentColor, // Handle color
    ),

    // InputDecoration theme for TextField
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: isLight ? LightThemeColors.textFieldFillColor : DarkThemeColors.textFieldFillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: isLight ? LightThemeColors.textFieldFocusedBorderColor : DarkThemeColors.textFieldFocusedBorderColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(
          color: isLight ? LightThemeColors.textFieldUnFocusedBorderColor : DarkThemeColors.textFieldUnFocusedBorderColor,
          width: 1,
        )
    
      ),
      hintStyle: TextStyle(
        color: isLight ? LightThemeColors.hintTextColor : DarkThemeColors.hintTextColor,
      )
    ),
  );
}


  /// update app theme and save theme type to shared pref
  /// (so when the app is killed and up again theme will remain the same)
  static changeTheme(){
    // *) check if the current theme is light (default is light)
    bool isLightTheme = MySharedPref.getThemeIsLight();
    // *) store the new theme mode on get storage
    MySharedPref.setThemeIsLight(!isLightTheme);
    // *) let GetX change theme
    Get.changeThemeMode(!isLightTheme ? ThemeMode.light : ThemeMode.dark);
  }

  /// check if the theme is light or dark
  bool get getThemeIsLight => MySharedPref.getThemeIsLight();
}