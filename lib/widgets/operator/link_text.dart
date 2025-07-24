import 'package:flutter/material.dart';

class TextLink extends StatefulWidget {
  const TextLink({
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
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
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
              fontSize: 13,
              color: _isHovered
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).textTheme.bodyMedium?.color ??
                        Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
