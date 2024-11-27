import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
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
    floatingActionButtonTheme: MyStyles.getFloatingActionButtonTheme(isLightTheme: isLight),
    
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

    outlinedButtonTheme: MyStyles.getOutlinedButtonTheme(isLightTheme: isLight),
    
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


class LChatTheme extends ChatTheme {
  /// Creates a default chat theme. Use this constructor if you want to
  /// override only a couple of properties, otherwise create a new class
  /// which extends [ChatTheme].
  const LChatTheme({
    super.attachmentButtonIcon,
    super.attachmentButtonMargin,
    super.backgroundColor = neutral7,
    super.bubbleMargin,
    super.dateDividerMargin = const EdgeInsets.only(
      bottom: 32,
      top: 16,
    ),
    super.dateDividerTextStyle = const TextStyle(
      color: neutral2,
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    super.deliveredIcon,
    super.documentIcon,
    super.emptyChatPlaceholderTextStyle = const TextStyle(
      color: neutral2,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.errorColor = error,
    super.errorIcon,
    super.inputBackgroundColor = neutral0,
    super.inputSurfaceTintColor = neutral0,
    super.inputElevation = 0,
    super.inputBorderRadius = const BorderRadius.vertical(
      top: Radius.circular(20),
    ),
    super.inputContainerDecoration,
    super.inputMargin = EdgeInsets.zero,
    super.inputPadding = const EdgeInsets.fromLTRB(24, 20, 24, 20),
    super.inputTextColor = neutral7,
    super.inputTextCursorColor,
    super.inputTextDecoration = const InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.zero,
      isCollapsed: true,
      fillColor: neutral0,
       focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
        ),
      ),   
    ),
    super.inputTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.messageBorderRadius = 20,
    super.messageInsetsHorizontal = 20,
    super.messageInsetsVertical = 16,
    super.messageMaxWidth = 440,
    super.primaryColor = LightThemeColors.primaryColor,
    super.receivedEmojiMessageTextStyle = const TextStyle(fontSize: 40),
    super.receivedMessageBodyBoldTextStyle,
    super.receivedMessageBodyCodeTextStyle,
    super.receivedMessageBodyLinkTextStyle,
    super.receivedMessageBodyTextStyle = const TextStyle(
      color: neutral0,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.receivedMessageCaptionTextStyle = const TextStyle(
      color: neutral2,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333,
    ),
    super.receivedMessageDocumentIconColor = LightThemeColors.primaryColor,
    super.receivedMessageLinkDescriptionTextStyle = const TextStyle(
      color: neutral0,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.428,
    ),
    super.receivedMessageLinkTitleTextStyle = const TextStyle(
      color: neutral0,
      fontSize: 16,
      fontWeight: FontWeight.w800,
      height: 1.375,
    ),
    super.secondaryColor = secondary,
    super.seenIcon,
    super.sendButtonIcon,
    super.sendButtonMargin,
    super.sendingIcon,
    super.sentEmojiMessageTextStyle = const TextStyle(fontSize: 40),
    super.sentMessageBodyBoldTextStyle,
    super.sentMessageBodyCodeTextStyle,
    super.sentMessageBodyLinkTextStyle,
    super.sentMessageBodyTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.sentMessageCaptionTextStyle = const TextStyle(
      color: neutral7WithOpacity,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333,
    ),
    super.sentMessageDocumentIconColor = neutral7,
    super.sentMessageLinkDescriptionTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.428,
    ),
    super.sentMessageLinkTitleTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 16,
      fontWeight: FontWeight.w800,
      height: 1.375,
    ),
    super.statusIconPadding = const EdgeInsets.symmetric(horizontal: 4),
    super.systemMessageTheme = const SystemMessageTheme(
      margin: EdgeInsets.only(
        bottom: 24,
        top: 8,
        left: 8,
        right: 8,
      ),
      textStyle: TextStyle(
        color: neutral2,
        fontSize: 12,
        fontWeight: FontWeight.w800,
        height: 1.333,
      ),
    ),
    super.typingIndicatorTheme = const TypingIndicatorTheme(
      animatedCirclesColor: neutral1,
      animatedCircleSize: 5.0,
      bubbleBorder: BorderRadius.all(Radius.circular(27.0)),
      bubbleColor: neutral7,
      countAvatarColor: LightThemeColors.primaryColor,
      countTextColor: secondary,
      multipleUserTextStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: neutral2,
      ),
    ),
    super.unreadHeaderTheme = const UnreadHeaderTheme(
      color: secondary,
      textStyle: TextStyle(
        color: neutral2,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.333,
      ),
    ),
    super.userAvatarImageBackgroundColor = Colors.transparent,
    super.userAvatarNameColors = colors,
    super.userAvatarTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    super.userNameTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    super.highlightMessageColor,
  });
}

/// Dark chat theme which extends [ChatTheme].
@immutable
class DChatTheme extends ChatTheme {
  /// Creates a dark chat theme. Use this constructor if you want to
  /// override only a couple of properties, otherwise create a new class
  /// which extends [ChatTheme].
  const DChatTheme({
    super.attachmentButtonIcon,
    super.attachmentButtonMargin,
    super.backgroundColor = dark,
    super.bubbleMargin,
    super.dateDividerMargin = const EdgeInsets.only(
      bottom: 32,
      top: 16,
    ),
    super.dateDividerTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    super.deliveredIcon,
    super.documentIcon,
    super.emptyChatPlaceholderTextStyle = const TextStyle(
      color: neutral2,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.errorColor = error,
    super.errorIcon,
    super.inputBackgroundColor = secondaryDark,
    super.inputSurfaceTintColor = secondaryDark,
    super.inputElevation = 0,
    super.inputBorderRadius = const BorderRadius.vertical(
      top: Radius.circular(20),
    ),
    super.inputContainerDecoration,
    super.inputMargin = EdgeInsets.zero,
    super.inputPadding = const EdgeInsets.fromLTRB(24, 20, 24, 20),
    super.inputTextColor = DarkThemeColors.displayTextColor,
    super.inputTextCursorColor,
    super.inputTextDecoration = const InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.zero,
      isCollapsed: true,
    ),
    super.inputTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.messageBorderRadius = 20,
    super.messageInsetsHorizontal = 20,
    super.messageInsetsVertical = 16,
    super.messageMaxWidth = 440,
    super.primaryColor = DarkThemeColors.primaryColor,
    super.receivedEmojiMessageTextStyle = const TextStyle(fontSize: 40),
    super.receivedMessageBodyBoldTextStyle,
    super.receivedMessageBodyCodeTextStyle,
    super.receivedMessageBodyLinkTextStyle,
    super.receivedMessageBodyTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.receivedMessageCaptionTextStyle = const TextStyle(
      color: neutral7WithOpacity,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333,
    ),
    super.receivedMessageDocumentIconColor = DarkThemeColors.primaryColor,
    super.receivedMessageLinkDescriptionTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.428,
    ),
    super.receivedMessageLinkTitleTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 16,
      fontWeight: FontWeight.w800,
      height: 1.375,
    ),
    super.secondaryColor = secondaryDark,
    super.seenIcon,
    super.sendButtonIcon,
    super.sendButtonMargin,
    super.sendingIcon,
    super.sentEmojiMessageTextStyle = const TextStyle(fontSize: 40),
    super.sentMessageBodyBoldTextStyle,
    super.sentMessageBodyCodeTextStyle,
    super.sentMessageBodyLinkTextStyle,
    super.sentMessageBodyTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.sentMessageCaptionTextStyle = const TextStyle(
      color: neutral7WithOpacity,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333,
    ),
    super.sentMessageDocumentIconColor = neutral7,
    super.sentMessageLinkDescriptionTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.428,
    ),
    super.sentMessageLinkTitleTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 16,
      fontWeight: FontWeight.w800,
      height: 1.375,
    ),
    super.statusIconPadding = const EdgeInsets.symmetric(horizontal: 4),
    super.systemMessageTheme = const SystemMessageTheme(
      margin: EdgeInsets.only(
        bottom: 24,
        top: 8,
        left: 8,
        right: 8,
      ),
      textStyle: TextStyle(
        color: neutral7,
        fontSize: 12,
        fontWeight: FontWeight.w800,
        height: 1.333,
      ),
    ),
    super.typingIndicatorTheme = const TypingIndicatorTheme(
      animatedCirclesColor: neutral7,
      animatedCircleSize: 5.0,
      bubbleBorder: BorderRadius.all(Radius.circular(27.0)),
      bubbleColor: dark,
      countAvatarColor: DarkThemeColors.primaryColor,
      countTextColor: secondary,
      multipleUserTextStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: neutral2,
      ),
    ),
    super.unreadHeaderTheme = const UnreadHeaderTheme(
      color: secondaryDark,
      textStyle: TextStyle(
        color: neutral7WithOpacity,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.333,
      ),
    ),
    super.userAvatarImageBackgroundColor = Colors.transparent,
    super.userAvatarNameColors = colors,
    super.userAvatarTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    super.userNameTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    super.highlightMessageColor,
  });
}
