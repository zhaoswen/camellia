
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ButtonIcon extends StatefulWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color color;
  final bool disabled;
  final bool isSelected;
  final bool isDisplayed;
  final Color selectedColor;
  final Color hoverColor;
  final Color backgroundColor;
  final Color iconColor;
  final double width;
  final double height;
  final double iconSize;

  const ButtonIcon({
    super.key,
    required this.iconData,
    this.onPressed,
    this.tooltip,
    this.disabled = false,
    this.isSelected = false,
    this.isDisplayed = true,
    this.color = Colors.black54,
    this.selectedColor = Colors.blueGrey,
    this.hoverColor = Colors.black12,
    this.backgroundColor = Colors.transparent,
    this.iconColor = Colors.black54,
    this.iconSize = 15,
    this.width = 30,
    this.height = 30,
  });

  @override
  State<ButtonIcon> createState() => _ButtonIconState();
}

class _ButtonIconState extends State<ButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return widget.isDisplayed
        ? SizedBox(
            width: widget.width,
            height: widget.height,
            child: IconButton(
              disabledColor: Colors.black26,
              color: widget.backgroundColor,
              // focusColor: Colors.blue,
              isSelected: widget.isSelected,
              padding: EdgeInsets.zero,
              splashRadius: 20,
              onPressed: widget.disabled ? null : widget.onPressed,
              tooltip: widget.tooltip,
              hoverColor: widget.hoverColor,
              icon: HugeIcon(
                icon: widget.iconData,
                size: widget.iconSize,
                color: widget.isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).iconTheme.color ?? Colors.black54,
              ),
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          )
        : SizedBox(width: 0, height: 0);
  }
}
