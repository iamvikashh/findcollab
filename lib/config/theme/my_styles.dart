import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dark_theme_colors.dart';
import 'my_fonts.dart';
import 'light_theme_colors.dart';

class MyStyles {
  ///icons theme
  static IconThemeData getIconTheme({required bool isLightTheme}) =>
      IconThemeData(
        color: isLightTheme
            ? LightThemeColors.iconColor
            : DarkThemeColors.iconColor,
      );

  ///app bar theme
  static AppBarTheme getAppBarTheme({required bool isLightTheme}) =>
      AppBarTheme(
        elevation: 0,
        titleTextStyle:
        getTextTheme(isLightTheme: isLightTheme).bodyMedium!.copyWith(
          color: Colors.white,
          fontSize: MyFonts.appBarTittleSize,
        ),
        iconTheme: IconThemeData(
            color: isLightTheme
                ? LightThemeColors.appBarIconsColor
                : DarkThemeColors.appBarIconsColor),
        backgroundColor: isLightTheme
            ? LightThemeColors.appBarColor
            : DarkThemeColors.appbarColor,
      );

  ///text theme
  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
    labelLarge: MyFonts.buttonTextStyle.copyWith(
      fontSize: MyFonts.buttonTextSize,
    ),
    bodyLarge: (MyFonts.bodyTextStyle).copyWith(
      fontWeight: FontWeight.normal,
      fontSize: MyFonts.bodyLargeSize,
      color: isLightTheme
          ? LightThemeColors.bodyTextColor
          : DarkThemeColors.bodyTextColor,
    ),
    bodyMedium: (MyFonts.bodyTextStyle).copyWith(
      fontSize: MyFonts.bodyMediumSize,
      color: isLightTheme
          ? LightThemeColors.bodyTextColor
          : DarkThemeColors.bodyTextColor,
    ),
    displayLarge: (MyFonts.displayTextStyle).copyWith(
      fontSize: MyFonts.displayLargeSize,
      fontWeight: FontWeight.bold,
      color: isLightTheme
          ? LightThemeColors.displayTextColor
          : DarkThemeColors.displayTextColor,
    ),
    bodySmall: TextStyle(
        color: isLightTheme
            ? LightThemeColors.bodySmallTextColor
            : DarkThemeColors.bodySmallTextColor,
        fontSize: MyFonts.bodySmallTextSize),
    displayMedium: (MyFonts.displayTextStyle).copyWith(
        fontSize: MyFonts.displayMediumSize,
        fontWeight: FontWeight.bold,
        color: isLightTheme
            ? LightThemeColors.displayTextColor
            : DarkThemeColors.displayTextColor),
    displaySmall: (MyFonts.displayTextStyle).copyWith(
      fontSize: MyFonts.displaySmallSize,
      fontWeight: FontWeight.bold,
      color: isLightTheme
          ? LightThemeColors.displayTextColor
          : DarkThemeColors.displayTextColor,
    ),
  );

  static ChipThemeData getChipTheme({required bool isLightTheme}) {
    return ChipThemeData(
      backgroundColor: isLightTheme
          ? LightThemeColors.chipBackground
          : DarkThemeColors.chipBackground,
      brightness: Brightness.light,
      labelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      secondaryLabelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      selectedColor: Colors.black,
      disabledColor: Colors.green,
      padding: const EdgeInsets.all(5),
      secondarySelectedColor: Colors.purple,
    );
  }

  ///Chips text style
  static TextStyle getChipTextStyle({required bool isLightTheme}) {
    return MyFonts.chipTextStyle.copyWith(
      fontSize: MyFonts.chipTextSize,
      color: isLightTheme
          ? LightThemeColors.chipTextColor
          : DarkThemeColors.chipTextColor,
    );
  }

  // elevated button text style
  static WidgetStateProperty<TextStyle?>? getElevatedButtonTextStyle(
      bool isLightTheme,
      {bool isBold = true,
      double? fontSize}) {
    return WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              color: isLightTheme
                  ? LightThemeColors.buttonTextColor
                  : DarkThemeColors.buttonTextColor);
        } else if (states.contains(WidgetState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isLightTheme
                  ? LightThemeColors.buttonDisabledTextColor
                  : DarkThemeColors.buttonDisabledTextColor);
        }
        return MyFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isLightTheme
                ? LightThemeColors.buttonTextColor
                : DarkThemeColors
                    .buttonTextColor); // Use the component's default.
      },
    );
  }

  //elevated button theme data
 static ElevatedButtonThemeData getElevatedButtonTheme(
    {required bool isLightTheme}) =>
  ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 8.h),
      ),
      textStyle: getElevatedButtonTextStyle(isLightTheme),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return isLightTheme
                ? LightThemeColors.buttonColor.withOpacity(0.5)
                : DarkThemeColors.buttonColor.withOpacity(0.5);
          } else if (states.contains(MaterialState.disabled)) {
            return isLightTheme
                ? LightThemeColors.buttonDisabledColor
                : DarkThemeColors.buttonDisabledColor;
          }
          return isLightTheme
              ? LightThemeColors.buttonColor
              : DarkThemeColors.buttonColor;
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return isLightTheme
                ? Colors.white.withOpacity(0.7)
                : Colors.black.withOpacity(0.7);
          } else if (states.contains(MaterialState.disabled)) {
            return isLightTheme
                ? Colors.grey
                : Colors.grey.shade800;
          }
          return isLightTheme ? Colors.white : Colors.black;
        },
      ),
    ),
  );

 static FloatingActionButtonThemeData getFloatingActionButtonTheme({required bool isLightTheme}) {
  return FloatingActionButtonThemeData(
    backgroundColor: isLightTheme ? LightThemeColors.buttonColor : DarkThemeColors.buttonColor,
    foregroundColor: isLightTheme ? Colors.white : Colors.black,
  );
 }
  //elevated button theme data
static OutlinedButtonThemeData getOutlinedButtonTheme(
    {required bool isLightTheme}) =>
  OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 8.h),
      ),
      textStyle: getElevatedButtonTextStyle(isLightTheme),
      
      // Side (border) styling
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(
              color: isLightTheme
                  ? LightThemeColors.primaryColor.withOpacity(0.7)
                  : DarkThemeColors.primaryColor.withOpacity(0.7),
              width: 1.5,
            );
          } else if (states.contains(MaterialState.disabled)) {
            return BorderSide(
              color: isLightTheme
                  ? Colors.grey
                  : Colors.grey.shade800,
              width: 1.5,
            );
          }
          return BorderSide(
            color: isLightTheme
                ? LightThemeColors.primaryColor
                : DarkThemeColors.primaryColor,
            width: 1.5,
          );
        },
      ),

      // Foreground (text and icon) color
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return isLightTheme
                ? LightThemeColors.primaryColor.withOpacity(0.7)
                : DarkThemeColors.primaryColor.withOpacity(0.7);
          } else if (states.contains(MaterialState.disabled)) {
            return isLightTheme
                ? Colors.grey
                : Colors.grey.shade800;
          }
          return isLightTheme
              ? LightThemeColors.primaryColor
              : DarkThemeColors.primaryColor;
        },
      ),

      // Background color
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return isLightTheme
                ? LightThemeColors.primaryColor.withOpacity(0.1)
                : DarkThemeColors.primaryColor.withOpacity(0.1);
          } else if (states.contains(MaterialState.disabled)) {
            return Colors.transparent;
          }
          return Colors.transparent;
        },
      ),

      // Overlay color for hover/focus effects
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return isLightTheme
                ? LightThemeColors.primaryColor.withOpacity(0.04)
                : DarkThemeColors.primaryColor.withOpacity(0.04);
          }
          if (states.contains(MaterialState.focused)) {
            return isLightTheme
                ? LightThemeColors.primaryColor.withOpacity(0.12)
                : DarkThemeColors.primaryColor.withOpacity(0.12);
          }
          return Colors.transparent;
        },
      ),
    ),
  );
 

}
