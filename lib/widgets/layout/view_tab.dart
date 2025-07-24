import 'package:camellia/shared/shared.dart';
import 'package:flutter/material.dart';

// 定义标签页数据
class TabItem {
  final String title;
  final Widget content;

  TabItem({required this.title, required this.content});
}

class ViewTab extends StatefulWidget {
  const ViewTab({
    super.key,
    required this.tabs,
    this.spacing = 0,
    this.padding = const EdgeInsets.all(0),
    this.contentPadding = const EdgeInsets.all(5),
    this.defaultIndex = 0,
  });

  // 标签页数据列表
  final List<TabItem> tabs;

  // 内容间隔
  final double spacing;

  // 全局Padding
  final EdgeInsetsGeometry padding;

  // 内容Padding
  final EdgeInsetsGeometry contentPadding;

  // 默认页
  final int defaultIndex;

  @override
  State<ViewTab> createState() => _ViewTabState();
}

class _ViewTabState extends State<ViewTab> {
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
                  indicatorColor: setting.theme.value.colors.primary.getColor(),
                  // 分割线颜色
                  dividerColor: setting.theme.value.colors.separator.getColor(),
                  // 未选中标签文本
                  unselectedLabelColor: setting.theme.value.colors.subTitle
                      .getColor(),
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  // 选中标签文本
                  labelColor: setting.theme.value.colors.primary.getColor(),
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
                        (tab) => Tab(
                          child: Text(
                            tab.title,
                            style: TextStyle(
                              fontFamily: setting.theme.value.fonts.family,
                            ),
                          ),
                        ),
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
