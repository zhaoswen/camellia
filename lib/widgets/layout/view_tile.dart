import 'package:camellia/shared/shared.dart';
import 'package:flutter/material.dart';

class ViewTile extends StatefulWidget {
  const ViewTile({super.key, required this.items, this.spacing = 10});

  // 列表
  final List<XTileViewItem> items;

  // 间距
  final double spacing;

  @override
  State<ViewTile> createState() => _ViewTileState();
}

class _ViewTileState extends State<ViewTile> {
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
                    color: setting.theme.value.colors.title.getColor(),
                  ),
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: setting.theme.value.fonts.family,
                    color: setting.theme.value.colors.subTitle.getColor(),
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
