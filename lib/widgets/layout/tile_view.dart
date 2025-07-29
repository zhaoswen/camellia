import 'package:flutter/material.dart';

class XTileView extends StatefulWidget {
  const XTileView({super.key, required this.items, this.spacing = 10});

  // 列表
  final List<XTileViewItem> items;

  // 间距
  final double spacing;

  @override
  State<XTileView> createState() => _XTileViewState();
}

class _XTileViewState extends State<XTileView> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      // padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 9,
        mainAxisSpacing: widget.spacing,
        crossAxisSpacing: widget.spacing,
      ),
      children: [
        for (var item in widget.items)
          InkWell(
            // 圆角
            borderRadius: BorderRadius.circular(15),
            onTap: item.onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                if (item.icon != null)
                  Icon(
                    item.icon,
                    size: 25,
                    color:
                        Theme.of(context).textTheme.titleMedium?.color ??
                        Colors.black,
                  ),
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 12,

                    color:
                        Theme.of(context).textTheme.titleSmall?.color ??
                        Colors.black54,
                    // 截断
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class XTileViewItem {
  final String title;
  final String subtitle;
  final IconData? icon;
  final Function() onTap;

  XTileViewItem({
    required this.title,
    required this.subtitle,
    this.icon,
    required this.onTap,
  });
}
