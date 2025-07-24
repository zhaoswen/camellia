
import 'package:flutter/material.dart';

class Panel extends StatefulWidget {
  final String name;

  // 边框方向
  final String border;

  // 主内容组件
  final Widget content;

  // 操作区域按钮
  final List<Widget> actions;

  // 内容内边距
  final EdgeInsetsGeometry padding;

  const Panel({
    super.key,
    required this.name,
    this.content = const Text(""),
    this.actions = const [],
    this.border = "left",
    this.padding = const EdgeInsets.only(
      top: 5,
      left: 10,
      right: 10,
      bottom: 5,
    ),
  });

  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          right: widget.border == "right"
              ? BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                )
              : BorderSide.none,
          left: widget.border == "left"
              ? BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                )
              : BorderSide.none,
          top: widget.border == "top"
              ? BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                )
              : BorderSide.none,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 面板标题
          Container(
            height: 35,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 13,
                    
                    color: Theme.of(context).textTheme.titleMedium?.color ?? Colors.black,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: widget.actions,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          // 主要内容
          Expanded(
            child: Container(padding: widget.padding, child: widget.content),
          ),
        ],
      ),
    );
  }
}
