import 'package:camellia/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 建议移动端使用
showSnackbar(
  String title,
  String content, {
  XSnackbarType type = XSnackbarType.info,
  int duration = 1,
  Widget button = const SizedBox(),
}) {
  Get.snackbar(
    title,
    content,
    maxWidth: 300,
    isDismissible: true,
    titleText: Text(
      title,
      style: TextStyle(
        color: type == XSnackbarType.error
            ? setting.theme.value.colors.danger.getColor()
            : type == XSnackbarType.warning
            ? setting.theme.value.colors.warning.getColor()
            : type == XSnackbarType.success
            ? setting.theme.value.colors.success.getColor()
            : setting.theme.value.colors.primary.getColor(),
        fontSize: 14,
        fontFamily: setting.theme.value.fonts.family,
      ),
    ),
    messageText: Text(
      content,
      style: TextStyle(
        color: setting.theme.value.colors.subTitle.getColor(),
        fontSize: 12,
        fontFamily: setting.theme.value.fonts.family,
      ),
    ),
    duration: Duration(seconds: duration),
    colorText: setting.theme.value.colors.title.getColor(),
    snackPosition: SnackPosition.TOP,
    margin: EdgeInsets.only(top: 15),

    backgroundColor: setting.theme.value.colors.background.getColor(),
    boxShadows: [
      BoxShadow(
        color: setting.theme.value.colors.subTitle.getColor().withAlpha(100),
        blurRadius: 10,
        spreadRadius: 1,
        offset: Offset(0, 5),
      ),
    ],
    // borderColor: type == XSnackbarType.error
    //     ? setting.theme.value.colors.danger.getColor()
    //     : type == XSnackbarType.warning
    //         ? setting.theme.value.colors.warning.getColor()
    //         : type == XSnackbarType.success
    //             ? setting.theme.value.colors.success.getColor()
    //             : setting.theme.value.colors.primary.getColor(),
    // borderWidth: 1,
    borderRadius: 10,
    overlayColor: setting.theme.value.colors.parentBackground.getColor(),
  );
}

enum XSnackbarType { success, error, warning, info }
