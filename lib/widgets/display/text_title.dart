import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({
    super.key,
    required this.title,
    this.fontSize = 14,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(5),
    this.alignment = Alignment.centerLeft,
    this.fontWeight = FontWeight.bold,
  });

  // 标题
  final String title;

  // 字体大小
  final double fontSize;

  // 内边距
  final EdgeInsetsGeometry padding;

  // 外边距
  final EdgeInsetsGeometry margin;

  final FontWeight fontWeight;

  // 对齐方式
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      alignment: alignment,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: setting.theme.value.fonts.family,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: setting.theme.value.colors.title.getColor(),
        ),
      ),
    );
  }
}

// 标题等级
enum TitleLevel { one, two, three, four, five, six }
