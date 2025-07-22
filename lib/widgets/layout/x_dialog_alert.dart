import 'package:camellia/shared/shared.dart';
import 'package:flutter/material.dart';

// 弹出对话框
void showXDialogAlert({
  required BuildContext context,
  required String title,
  double width = 500,
  double height = 300,
  String content = "警告内容",
  bool showButton = true,
  String confirm = "确认",
  String cancel = "取消",
  // 顶部区域，允许用户加一个自定义组件到标题栏
  Widget header = const SizedBox(),
  required Function() onConfirm,
  required Function() onCancel,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: setting.theme.value.colors.background.getColor(),
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 0),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 10,
              children: [
                // 标题
                Container(
                  height: 40,
                  padding: EdgeInsets.only(bottom: 10, left: 5, right: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: setting.theme.value.colors.separator.getColor(),
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
                            color: setting.theme.value.colors.title.getColor(),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      content,
                      style: TextStyle(
                        fontFamily: setting.theme.value.fonts.family,
                        color: setting.theme.value.colors.subTitle.getColor(),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                // 按钮
                if (showButton)
                  Container(
                    // height: 45,
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 确定按钮
                        TextButton(
                          onPressed: () {
                            onConfirm();
                            Navigator.of(context).pop();
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
                            Navigator.of(context).pop();
                          },
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
