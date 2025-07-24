import 'package:camellia/shared/shared.dart';
import 'package:camellia/widgets/operator/link_text.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// 面包屑组件
class Breadcrumb extends StatefulWidget {
  const Breadcrumb({
    super.key,
    this.height = 40,
    required this.items,
    this.middleIcon = HugeIcons.strokeRoundedArrowRight01,
    this.tail = const SizedBox(),
    this.head = const SizedBox(),
  });

  // 整体高度
  final double height;

  // 面包列表
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
              color: setting.theme.value.colors.subTitle.getColor(),
            ),
          ),
        );
      }
    }
    return list;
  }
}

class BreadcrumbItem {
  // 标题
  final String title;

  // key
  final String key;

  final List<BreadcrumbItem> children;

  Function() onTap;

  BreadcrumbItem({
    required this.title,
    required this.key,
    this.children = const [],
    required this.onTap,
  });
}
