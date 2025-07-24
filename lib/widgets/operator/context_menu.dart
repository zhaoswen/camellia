import 'package:camellia/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

void showContextMenu(
  BuildContext context,
  Offset position,
  List<ContextMenuItem> items,
) {
  if (items.isEmpty) {
    return;
  }
  List<PopupMenuEntry<dynamic>> result = [];
  for (ContextMenuItem item in items) {
    if (item.isDisplayed == false) {
      continue;
    }
    result.add(
      PopupMenuItem(
        onTap: item.onTap,
        height: 30,
        child: Row(
          children: [
            HugeIcon(
              icon: item.icon,
              size: 13,
              color: setting.theme.value.colors.title.getColor(),
            ),
            SizedBox(width: 10),
            Text(
              item.title,
              style: TextStyle(
                fontSize: 13,
                fontFamily: setting.theme.value.fonts.family,
                color: setting.theme.value.colors.title.getColor(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  showMenu(
    context: context,
    color: setting.theme.value.colors.background.getColor(),
    popUpAnimationStyle: AnimationStyle.noAnimation,
    // surfaceTintColor: Colors.transparent,
    shadowColor: Colors.transparent,
    menuPadding: EdgeInsets.all(5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      side: BorderSide(color: setting.theme.value.colors.separator.getColor()),
    ),
    position: RelativeRect.fromLTRB(
      position.dx,
      position.dy,
      position.dx,
      position.dy,
    ),
    items: result,
  );
}

class ContextMenuItem {
  String title;
  IconData icon;
  bool? isDisplayed;
  Function() onTap;

  ContextMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.isDisplayed,
  });
}
