import 'package:camellia/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../display/x_message.dart';

class XOperateButton extends StatefulWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color color;
  final bool disabled;
  final bool isSelected;
  final bool isDisplayed;
  final Color selectedColor;
  final double width;
  final double height;
  final double iconSize;

  // 如果为true，第一次点击不会执行操作，第二次点击才会触发
  final bool isDanger;

  const XOperateButton({
    super.key,
    required this.iconData,
    this.onPressed,
    this.tooltip,
    this.isDanger = false,
    this.disabled = false,
    this.isSelected = false,
    this.isDisplayed = true,
    this.color = Colors.black54,
    this.selectedColor = Colors.blueGrey,
    this.iconSize = 15,
    this.width = 30,
    this.height = 30,
  });

  @override
  State<XOperateButton> createState() => _XOperateButtonState();
}

class _XOperateButtonState extends State<XOperateButton> {
  bool isDangerState = false;

  @override
  Widget build(BuildContext context) {
    return widget.isDisplayed
        ? SizedBox(
            width: widget.width,
            height: widget.height,
            child: IconButton(
              disabledColor: Colors.black26,
              isSelected: widget.isSelected,
              splashRadius: 20,
              onPressed: widget.disabled
                  ? null
                  : () {
                      if (!widget.isDanger) {
                        widget.onPressed!();
                        return;
                      }
                      setState(() {
                        // 警告用户危险操作
                        // showSnackbar(
                        //     S.current.warn, S.current.hint_danger_operator_warn,
                        //     type: XSnackbarType.warning, duration: 2);
                        MessageOverlay.showMessage(
                          "危险操作",
                          title: "警告",
                          type: MessageType.warning,
                          context: context,
                        );
                      });
                    },
              onLongPress: () {
                widget.onPressed!();
                // setState(() {
                //   isDangerState = false;
                // });
              },
              tooltip: widget.tooltip,
              hoverColor: widget.isDanger
                  ? setting.theme.value.colors.danger.getColor().withAlpha(20)
                  : setting.theme.value.colors.parentBackground.getColor(),
              focusColor: setting.theme.value.colors.parentBackground
                  .getColor(),
              icon: HugeIcon(
                icon: widget.iconData,
                size: widget.iconSize,
                color: widget.disabled
                    ? setting.theme.value.colors.disabled.getColor()
                    : widget.isSelected
                    ? setting.theme.value.colors.primary.getColor()
                    : isDangerState
                    ? setting.theme.value.colors.danger.getColor()
                    : setting.theme.value.colors.standardIcon.getColor(),
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
