// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';

// 当前状态
// 这些内容会在程序重启后丢失，也允许用户主动清理
class RuntimeData extends GetxController {
  // 是否为编辑模式
  RxBool editMode = false.obs;

  // 已保存
  RxBool saved = true.obs;

  // 数据源存储状态
  RxBool datasourceSaved = true.obs;

  // 当前设计器的Context
  var designContext;

  // 主界面的Context
  var homeContext;

  // 当前左侧面板
  var leftPanel = Panel.none.obs;

  // 当前右侧面板
  var rightPanel = Panel.none.obs;

  // 当前底部面板
  var bottomPanel = Panel.none.obs;
}

enum Panel {
  // 空
  none,
  // 描述文件
  profile,
  // 版本管理
  version,
  // 数据源
  dataSource,
  // 历史记录
  history,
  // 当前问题
  bug,
  // AI
  ai,
  // 文档
  document,
  // 控制台
  console,
}
