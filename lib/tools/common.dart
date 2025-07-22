// 切换语言
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../shared/shared.dart';
import 'logger.dart';

// 切换明暗模式
switchDarkMode() {
  setting.darkMode.value = !setting.darkMode.value;
  log(
    LogType.operator,
    "切换明暗模式到 ${setting.darkMode.value ? "暗色" : "亮色"}",
    LogRecorder.ui,
  );
}

// 获取一个可用的context
BuildContext? getContext() {
  if (runtime.designContext != null && runtime.designContext!.mounted) {
    // 最先寻找设计器的context
    return runtime.designContext;
  } else if (runtime.homeContext != null && runtime.homeContext!.mounted) {
    // 如果还没有，就用Get的context
    return runtime.homeContext;
  } else if (Get.context != null && Get.context!.mounted) {
    return Get.context!;
  } else {
    return null;
  }
}

// 退出应用程序
exitApp() async {
  // 关闭主窗口
  appWindow.close();
}
