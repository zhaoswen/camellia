// 检查保存状态
import 'package:flutter/material.dart';

import '../shared/shared.dart';
import '../widgets/layout/x_dialog_alert.dart';

void checkSaveStatus(
  BuildContext context, {
  Function? onConfirm,
  Function? onCancel,
}) {
  // 如果有未保存的修改，
  if (!runtime.saved.value) {
    // 弹出提示框
    showXDialogAlert(
      context: context,
      title: "警告",
      content: "有未保存的修改，是否保存？",
      onConfirm: () {
        if (onConfirm != null) {
          onConfirm.call();
        }
      },
      onCancel: () {
        if (onCancel != null) {
          onCancel.call();
        }
      },
    );
  } else {
    // 如果没有未保存的修改，直接执行回调
    if (onConfirm != null) {
      onConfirm.call();
    }
  }
}
