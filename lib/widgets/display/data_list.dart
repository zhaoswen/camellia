import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class XDataList extends StatefulWidget {
  const XDataList({super.key, required this.items});

  final List<CListItem> items;

  @override
  State<XDataList> createState() => _XDataListState();
}

class _XDataListState extends State<XDataList> {
  late List<DragAndDropList> _contents;

  @override
  void initState() {
    super.initState();

    _contents = List.generate(1, (index) {
      return DragAndDropList(
        header: null,
        children: <DragAndDropItem>[
          DragAndDropItem(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              decoration: BoxDecoration(),
              child: Row(
                spacing: 10,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedInformationSquare,
                    color: Theme.of(context).iconTheme.color ?? Colors.black87,
                    size: 13,
                  ),
                  Text('选项 1'),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              decoration: BoxDecoration(),
              child: Row(
                spacing: 10,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedInformationSquare,
                    color:
                        Theme.of(context).textTheme.titleSmall?.color ??
                        Colors.black54,
                    size: 13,
                  ),
                  Text('选项 2'),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              decoration: BoxDecoration(),
              child: Row(
                spacing: 10,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedInformationSquare,
                    color: Theme.of(context).iconTheme.color ?? Colors.black87,
                    size: 13,
                  ),
                  Text('选项 3'),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // var backgroundColor = Colors.transparent;

    return Scaffold(
      backgroundColor: Colors.transparent,
      // persistentFooterAlignment: AlignmentDirectional.centerStart,
      body: DragAndDropLists(
        children: _contents,
        horizontalAlignment: MainAxisAlignment.spaceBetween,
        // verticalAlignment: CrossAxisAlignment.stretch,
        onItemReorder: _onItemReorder,
        onListReorder: _onListReorder,
        listPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemDivider: Divider(
          thickness: 2,
          height: 1,
          color: Colors.transparent,
        ),
        itemDecorationWhileDragging: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        listInnerDecoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        lastItemTargetHeight: 0,
        addLastItemTargetHeightToTop: true,
        lastListTargetSize: 0,
        itemDragHandle: DragHandle(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedMenu01,
              size: 13,
              color:
                  Theme.of(context).textTheme.titleSmall?.color ??
                  Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  _onItemReorder(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }
}

class CListItem {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final Function()? onTap;
  final Function()? onLongPress;
  final List<CListItem>? children;

  CListItem({
    required this.title,
    this.subtitle,
    required this.icon,
    this.onTap,
    this.onLongPress,
    this.iconColor,
    this.backgroundColor,
    this.children,
  });
}
