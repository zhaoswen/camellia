
import 'package:camellia/widgets/display/empty.dart';
import 'package:camellia/widgets/display/text_title.dart';
import 'package:camellia/widgets/operator/button_icon.dart';
import 'package:camellia/widgets/operator/button_text.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:uuid/v4.dart';

/// 表单列表组件，用于展示与修改数组类型的数据
class FormList extends StatefulWidget {
  final String title;
  final List<XFormListItem> items; // 接收数组数据
  final ValueChanged<List<XFormListItem>> onChanged; // 回调函数，当列表变化时触发
  // 默认新节点名称
  final String defaultNodeName;

  // 新增项默认图标
  final IconData defaultNodeIcon;

  // 添加按钮名称
  final String addButtonName;

  // 组件高度
  final double height;

  const FormList({
    super.key,
    required this.items,
    required this.onChanged,
    this.defaultNodeName = '新节点',
    this.addButtonName = '添加',
    this.height = 200,
    this.defaultNodeIcon = HugeIcons.strokeRoundedMore,
    required this.title,
  });

  @override
  State<FormList> createState() => _FormListState();
}

class _FormListState extends State<FormList> {
  late List<XFormListItem> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items); // 复制初始数据
  }

  void _addItem() {
    setState(() {
      _items.add(
        XFormListItem(
          UuidV4().generate(),
          icon: widget.defaultNodeIcon,
          title: widget.defaultNodeName,
        ),
      ); // 增加新项
      widget.onChanged(_items); // 触发回调
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index); // 删除指定项
      widget.onChanged(_items); // 触发回调
    });
  }

  void _editItem(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextTitle(title: widget.title, fontSize: 14),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: Theme.of(context).dividerColor,
            ),
          ),
          height: widget.height,
          child: Column(
            children: [
              Expanded(
                child: _items.isEmpty
                    ? Empty()
                    : ListView.builder(
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: HugeIcon(
                              icon: _items[index].icon,
                              size: 16,
                              color: Theme.of(context).textTheme.titleMedium?.color ?? Colors.black
                                  ,
                            ),
                            title: Tooltip(
                              message: _items[index].key,
                              child: Text(
                                _items[index].title,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13,
                                  
                                  color: Theme.of(context).textTheme.titleMedium?.color ?? Colors.black
                                      ,
                                ),
                              ),
                            ),
                            trailing: SizedBox(
                              width: 60,
                              // color: Colors.blueGrey,
                              child: Row(
                                children: [
                                  ButtonIcon(
                                    iconData: HugeIcons.strokeRoundedEdit02,
                                    onPressed: () => _editItem(index),
                                  ),
                                  ButtonIcon(
                                    iconData: HugeIcons.strokeRoundedDelete02,
                                    onPressed: () => _removeItem(index),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
                child: ButtonText(
                  // 宽度与父组件宽度一致
                  width: double.infinity,
                  onPressed: _addItem, // 增加按钮
                  text: widget.addButtonName,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class XFormListItem {
  // 图标
  final IconData icon;

  // 标题
  final String title;

  // key
  final String key;

  // 值
  final dynamic value;

  // 备选值列表（可以为空）
  final List<dynamic>? options;

  // 操作类型
  // 文本、数组、对象体、数字、日期
  final XFormListItemType type;

  XFormListItem(
    this.key, {
    required this.title,
    this.value,
    this.type = XFormListItemType.text,
    this.icon = HugeIcons.strokeRoundedMore,
    this.options,
  });
}

enum XFormListItemType {
  // 文本
  text,
  // 数组
  array,
  // 对象体
  object,
  // 数字
  number,
  // 日期
  date,
}
