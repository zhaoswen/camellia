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
            Theme.of(context).scaffoldBackgroundColor,
          ),
          foregroundColor: WidgetStateProperty.all(
            Theme.of(context).textTheme.titleMedium?.color ?? Colors.black,
          ),
          overlayColor: WidgetStateProperty.all(
            Theme.of(context).cardTheme.color,
          ),
          textStyle: WidgetStateProperty.all(TextStyle(fontSize: 13)),
        ),
        child: Text(widget.text),
      ),
    );
  }
}
