import 'package:camellia/widgets/operator/link_text.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

/// Breadcrumb Widget
///
/// The breadcrumb component is used to display a series of paths, such as: Home/Application Management/Application List
///
/// 面包屑组件
///
/// 面包屑组件主要用于展示一系列的路径，比如：首页/应用管理/应用列表
class Breadcrumb extends StatefulWidget {
  const Breadcrumb({
    super.key,
    this.height = 40,
    required this.items,
    this.middleIcon = HugeIcons.strokeRoundedArrowRight01,
    this.tail = const SizedBox(),
    this.head = const SizedBox(),
  });

  /// height
  ///
  /// 整体高度
  final double height;

  /// items, all items must be ordered
  ///
  /// 面包列表，也就是所有的路径，注意此部分有顺序要求
  final List<BreadcrumbItem> items;

  // 自定义中间图标
  final IconData middleIcon;

  // 尾部按钮（会自动放到最后）
  final Widget tail;

  // 前部组件
  final Widget head;

  @override
  State<Breadcrumb> createState() => _BreadcrumbState();
}

class _BreadcrumbState extends State<Breadcrumb> {
  @override
  Widget build(BuildContext context) {
    List<Widget> mainRow = [];
    mainRow.add(widget.head);
    mainRow.add(
      Expanded(
        child: SizedBox(
          height: 20,
          child: ListView(
            // 对齐方式
            scrollDirection: Axis.horizontal,
            children: buildRow(),
          ),
        ),
      ),
    );
    // mainRow.add(const Spacer());
    mainRow.add(widget.tail);
    return SizedBox(
      height: widget.height,
      child: Row(children: mainRow),
    );
  }

  List<Widget> buildRow() {
    List<Widget> list = [];
    for (int i = 0; i < widget.items.length; i++) {
      list.add(
        TextLink(
          onPressed: widget.items[i].onTap,
          height: 20,
          text: widget.items[i].title,
        ),
      );
      if (i != widget.items.length - 1 && widget.items.length != 1) {
        list.add(
          Container(
            // height: 5,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: HugeIcon(
              icon: widget.middleIcon,
              size: 13,
              color: Theme.of(context).dividerColor,
            ),
          ),
        );
      }
    }
    return list;
  }
}

/// BreadcrumbItem
///
/// 面包屑子项定义
class BreadcrumbItem {
  /// Title of the item, required
  ///
  /// 面包屑显示标题，必需属性
  final String title;

  /// Key of the item, required
  ///
  /// 面包屑key，必需属性
  final String key;

  /// Children of the item, required
  ///
  /// 子级，必需属性
  final List<BreadcrumbItem> children;

  /// Callback when item is tapped, required
  ///
  /// 点击事件，必需属性
  Function() onTap;

  /// BreadcrumbItem constructor
  BreadcrumbItem({
    required this.title,
    required this.key,
    this.children = const [],
    required this.onTap,
  });
}
