import '../../widgets/x_context_menu.dart';

class StardustMenuInfo {
  final String title;

  // 事件
  final Function() onTap;

  // 字体大小
  final double fontSize = 14;

  // 数据
  final List<ContextMenuItem> contextMenus;

  // 是否选中
  final bool isSelected;

  StardustMenuInfo({
    required this.title,
    required this.onTap,
    this.isSelected = false,
    this.contextMenus = const [],
  });

  @override
  String toString() {
    return 'SMenuInfo{title: $title, onTap: $onTap, fontSize: $fontSize, menus:$contextMenus}';
  }
}
