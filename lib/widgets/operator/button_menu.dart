import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class XMenuButton extends StatefulWidget {
  const XMenuButton.XMenuButton({
    super.key,
    this.title = "",
    this.menuItems = const [],
    this.iconData,
    this.offset = Offset.zero,
    this.width = 140,
    this.iconSize = 1,
    required this.onTap,
  });

  // 下拉菜单标题
  final String title;

  // 下拉菜单图标，目前不能和title共存，优先使用icon样式
  final IconData? iconData;

  // 下拉菜单项
  final List<MenuItem> menuItems;

  // 下拉内容偏移，默认Zero偏移
  final Offset offset;

  // 菜单宽度
  final double width;

  // 图标大小
  final double iconSize;

  // 触发事件回调
  final Function(MenuItem) onTap;

  @override
  // ignore: library_private_types_in_public_api
  _XMenuButtonState createState() => _XMenuButtonState();
}

class _XMenuButtonState extends State<XMenuButton> {
  OverlayEntry? _overlayEntry;
  bool _isMenuOpen = false;

  void _showMenu(BuildContext context, Offset buttonPosition) {
    if (_isMenuOpen) {
      _hideMenu();
      return;
    }

    _overlayEntry = OverlayEntry(
      maintainState: false,
      builder: (context) => Positioned(
        width: widget.width,
        top: buttonPosition.dy + 30, // 调整菜单的位置
        left: buttonPosition.dx,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          shadowColor: Colors.transparent,
          elevation: 4.0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
            ),
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: makeListTile(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    _isMenuOpen = true;
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _isMenuOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return widget.iconData != null
        ? SizedBox(
            height: 27,
            width: 27,
            child: IconButton(
              splashRadius: 20,
              hoverColor: Theme.of(context).cardTheme.color,
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () {
                final RenderBox buttonBox =
                    context.findRenderObject() as RenderBox;
                // 坐标位置
                final Offset buttonPosition = buttonBox.localToGlobal(
                  widget.offset,
                );
                _showMenu(context, buttonPosition);
              },
              icon: HugeIcon(
                icon: widget.iconData!,
                size: 13,
                color: Theme.of(context).iconTheme.color ?? Colors.black54,
              ),
            ),
          )
        : TextButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
              ),
            ),
            onPressed: () {
              final RenderBox buttonBox =
                  context.findRenderObject() as RenderBox;
              final Offset buttonPosition = buttonBox.localToGlobal(
                widget.offset,
              );
              _showMenu(context, buttonPosition);
            },
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,

                color:
                    Theme.of(context).textTheme.titleMedium?.color ??
                    Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          );
  }

  List<Widget> makeListTile() {
    List<Widget> menuItemWidgets = [];

    for (MenuItem item in widget.menuItems) {
      menuItemWidgets.add(
        ListTile(
          leading: HugeIcon(
            icon: item.iconData == null
                ? HugeIcons.strokeRoundedMenu02
                : item.iconData!,
            size: 13,
            color:
                Theme.of(context).textTheme.titleSmall?.color ?? Colors.black54,
          ),
          title: Text(
            item.title,
            style: TextStyle(
              fontSize: 13,

              color:
                  Theme.of(context).textTheme.titleSmall?.color ??
                  Colors.black54,
            ),
          ),
          onTap: () {
            item.onTap(item.title);
            widget.onTap(item);
            _hideMenu();
            // 处理选项的点击事件
          },
        ),
      );
    }

    return menuItemWidgets;
  }
}

class MenuItem {
  final String title;

  // 要执行的方法
  final Function(String) onTap;

  // 图标
  final IconData? iconData;

  MenuItem({required this.title, required this.onTap, this.iconData});
}
