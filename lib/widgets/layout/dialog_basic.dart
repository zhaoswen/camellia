import 'package:camellia/shared/shared.dart';
import 'package:camellia/widgets/display/x_empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 弹出对话框
void showXDialogBasic({
  required BuildContext context,
  required String title,
  double width = 500,
  double height = 500,
  Widget content = const XEmpty(),
  bool showButton = true,
  bool showHeader = true,
  String confirm = "",
  String cancel = "",
  // 背景图片
  String backgroundImage = "",
  // 顶部区域，允许用户加一个自定义组件到标题栏
  Widget header = const SizedBox(),
  required Function() onConfirm,
  required Function() onCancel,
}) {
  if (confirm == "") {
    confirm = "确认";
  }
  if (cancel == "") {
    cancel = "取消";
  }
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: backgroundImage != ""
            ? Colors.transparent
            : setting.theme.value.colors.background.getColor(),
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: backgroundImage != ""
                ? DecorationImage(
                    image: AssetImage(backgroundImage),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 0),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 10,
              children: [
                // 标题
                if (showHeader)
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(bottom: 10, left: 5, right: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: setting.theme.value.colors.separator
                              .getColor(),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Text(
                            title,
                            style: TextStyle(
                              fontFamily: setting.theme.value.fonts.family,
                              color: setting.theme.value.colors.title
                                  .getColor(),
                              // fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        header,
                      ],
                    ),
                  ),
                // 主内容
                Expanded(child: SingleChildScrollView(child: content)),
                // 按钮
                if (showButton)
                  Container(
                    // height: 45,
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        // 确定按钮
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              setting.theme.value.colors.background.getColor(),
                            ),
                            overlayColor: WidgetStateProperty.all(
                              setting.theme.value.colors.parentBackground
                                  .getColor(),
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () {
                            onConfirm();
                            Get.back();
                          },
                          child: Text(
                            confirm,
                            style: TextStyle(
                              fontFamily: setting.theme.value.fonts.family,
                              color: setting.theme.value.colors.subTitle
                                  .getColor(),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        // 取消按钮
                        TextButton(
                          onPressed: () {
                            onCancel();
                            Get.back();
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              setting.theme.value.colors.background.getColor(),
                            ),
                            overlayColor: WidgetStateProperty.all(
                              setting.theme.value.colors.parentBackground
                                  .getColor(),
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: Text(
                            cancel,
                            style: TextStyle(
                              fontFamily: setting.theme.value.fonts.family,
                              color: setting.theme.value.colors.subTitle
                                  .getColor(),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
