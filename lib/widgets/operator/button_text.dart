import 'package:camellia/shared/shared.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  const ButtonText({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 30,
    this.width = 80,
  });

  // 回调
  final Function() onPressed;

  // 按钮名称
  final String text;

  // 按钮高度
  final double height;

  final double width;

  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          // 圆角
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          // 背景
          backgroundColor: WidgetStateProperty.all(
            setting.theme.value.colors.inputBackground.getColor(),
          ),
          foregroundColor: WidgetStateProperty.all(
            setting.theme.value.colors.title.getColor(),
          ),
          overlayColor: WidgetStateProperty.all(
            setting.theme.value.colors.parentBackground.getColor(),
          ),
          textStyle: WidgetStateProperty.all(
            TextStyle(
              fontFamily: setting.theme.value.fonts.family,
              fontSize: 13,
            ),
          ),
        ),
        child: Text(widget.text),
      ),
    );
  }
}
