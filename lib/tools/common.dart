// 切换语言
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';
import '../shared/shared.dart';
import 'logger.dart';

switchLanguage() {
  if (setting.language.value == 'zh') {
    setting.language.value = 'en';
    S.delegate.load(Locale('en'));
  } else {
    setting.language.value = 'zh';
    S.delegate.load(Locale('zh'));
  }
  log(
    LogType.operator,
    "切换语言到 ${setting.language.value == 'zh' ? 'English' : '中文'}",
    LogRecorder.ui,
  );
}

// 切换明暗模式
switchDarkMode() {
  setting.darkMode.value = !setting.darkMode.value;
  log(
    LogType.operator,
    "切换明暗模式到 ${setting.darkMode.value ? S.current.night_mode : S.current.light_mode}",
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
