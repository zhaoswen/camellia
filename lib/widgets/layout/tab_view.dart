import 'package:flutter/material.dart';

// 定义标签页数据
class XTabViewItem {
  final String title;
  final Widget content;

  XTabViewItem({required this.title, required this.content});
}

class XTabView extends StatefulWidget {
  const XTabView({
    super.key,
    required this.tabs,
    this.spacing = 0,
    this.padding = const EdgeInsets.all(0),
    this.contentPadding = const EdgeInsets.all(5),
    this.defaultIndex = 0,
  });

  // 标签页数据列表
  final List<XTabViewItem> tabs;

  // 内容间隔
  final double spacing;

  // 全局Padding
  final EdgeInsetsGeometry padding;

  // 内容Padding
  final EdgeInsetsGeometry contentPadding;

  // 默认页
  final int defaultIndex;

  @override
  State<XTabView> createState() => _XTabViewState();
}

class _XTabViewState extends State<XTabView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: DefaultTabController(
        length: widget.tabs.length,
        initialIndex: widget.defaultIndex,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawerScrimColor: Colors.transparent,
          body: Column(
            spacing: widget.spacing,
            children: [
              Container(
                height: 40,
                padding: EdgeInsets.all(5),
                child: TabBar(
                  // 标签栏指示器颜色
                  indicatorColor: Theme.of(context).primaryColor,
                  // 分割线颜色
                  dividerColor: Theme.of(context).dividerColor,
                  // 未选中标签文本
                  unselectedLabelColor:
                      Theme.of(context).textTheme.titleSmall?.color ??
                      Colors.black54,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  // 选中标签文本
                  labelColor: Theme.of(context).primaryColor,
                  // splashBorderRadius: BorderRadius.circular(5),
                  // 标签栏指示器高度
                  indicatorWeight: 3,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  // 标签栏高度
                  indicatorSize: TabBarIndicatorSize.label,
                  // 标签页列表
                  tabs: widget.tabs
                      .map(
                        (tab) =>
                            Tab(child: Text(tab.title, style: TextStyle())),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: Container(
                  padding: widget.contentPadding,
                  child: TabBarView(
                    children: widget.tabs.map((tab) => tab.content).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
