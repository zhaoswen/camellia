import 'package:camellia/shared/shared.dart';
import 'package:flutter/material.dart';

class Xtextlink extends StatefulWidget {
  const Xtextlink({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 30,
  });

  // 回调
  final VoidCallback onPressed;

  // 按钮名称
  final String text;

  // 按钮高度
  final double height;

  @override
  State<Xtextlink> createState() => _XtextlinkState();
}

class _XtextlinkState extends State<Xtextlink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: InkWell(
          onTap: widget.onPressed,
          child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: setting.theme.value.fonts.family,
              fontSize: 13,
              color: _isHovered
                  ? setting.theme.value.colors.primary.getColor()
                  : setting.theme.value.colors.text.getColor(),
            ),
          ),
        ),
      ),
    );
  }
}
