import 'package:flutter/material.dart';

final ThemeData simpleTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: const Color.fromARGB(255, 18, 115, 250),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 18, 115, 250),
    // 危险/错误色（通常为红色系）
    error: Colors.redAccent,
  ).copyWith(
    // 警告色（通常为黄色系）
    secondary: Colors.amberAccent,
    // 成功色（通常为绿色系）
    primaryContainer: Colors.greenAccent,
    // 禁用
    tertiary: Colors.grey,
  ),
  cardTheme: CardThemeData(color: Colors.black54),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 13),
    // 默认字体
    bodyMedium: TextStyle(fontSize: 12, color: Colors.white70),
    bodySmall: TextStyle(fontSize: 11),
    titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    // title
    titleMedium: TextStyle(
        fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87),
    // subtitle
    titleSmall: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87),
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
  iconTheme: const IconThemeData(
    color: Color(0xff333333),
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
