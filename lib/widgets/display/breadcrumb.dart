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
class XBreadcrumb extends StatefulWidget {
  const XBreadcrumb({
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
  final List<XBreadcrumbItem> items;

  /// middleIcon
  ///
  /// 中间分隔图标，默认使用右箭头图标
  final IconData middleIcon;

  /// tail
  ///
  /// 尾部按钮（会自动放到最后）
  final Widget tail;

  /// head
  ///
  /// 前部组件
  final Widget head;

  @override
  State<XBreadcrumb> createState() => _XBreadcrumbState();
}

class _XBreadcrumbState extends State<XBreadcrumb> {
  @override
  Widget build(BuildContext context) {
    // 构建主行组件列表
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

  /// buildRow
  ///
  /// 构建面包屑行，包括文本链接和分隔符
  ///
  /// 此方法会遍历所有面包屑项，为每个项创建TextLink组件，并在项之间添加分隔符图标
  /// 最后一项不会添加分隔符
  List<Widget> buildRow() {
    List<Widget> list = [];
    for (int i = 0; i < widget.items.length; i++) {
      list.add(
        XTextLink(
          onPressed: widget.items[i].onTap,
          height: 20,
          text: widget.items[i].title,
        ),
      );
      // 添加分隔符图标（除了最后一个元素）
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
///
/// 用于表示面包屑导航中的单个路径项，包含标题、唯一标识符、子项列表和点击回调
class XBreadcrumbItem {
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
  final List<XBreadcrumbItem> children;

  /// Callback when item is tapped, required
  ///
  /// 点击事件，必需属性
  Function() onTap;

  /// BreadcrumbItem constructor
  ///
  /// 构造函数，创建一个面包屑项目
  /// [title] 显示的文本标题
  /// [key] 唯一标识符
  /// [children] 子项目列表
  /// [onTap] 点击回调函数
  XBreadcrumbItem({
    required this.title,
    required this.key,
    this.children = const [],
    required this.onTap,
  });
}
