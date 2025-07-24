import 'package:flutter/material.dart';

final ThemeData simpleTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color.fromARGB(255, 18, 115, 250),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 13),
    // 默认字体
    bodyMedium: TextStyle(fontSize: 12, color: Colors.black87),
    bodySmall: TextStyle(fontSize: 11),
    titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    headlineLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    headlineSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color.fromARGB(255, 18, 115, 250),
    disabledColor: Color.fromARGB(255, 18, 115, 250),
  ),
  // 文本按钮默认样式
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      padding: EdgeInsetsGeometry.zero,
      disabledForegroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 18, 115, 250),
    ),

    border: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        style: BorderStyle.solid,
        color: Color.fromARGB(255, 18, 115, 250),
      ),
    ),
    filled: false,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        style: BorderStyle.solid,
        color: Color.fromARGB(255, 18, 115, 250),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      padding: EdgeInsetsGeometry.zero,
      iconSize: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  ),
  // 提示框默认样式
  useSystemColors: true,
  dividerTheme: const DividerThemeData(
    color: Colors.black12,
    thickness: 1,
    indent: 0,
    endIndent: 0,
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: Colors.white,
    actionsPadding: EdgeInsets.all(10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
);
