import 'package:camellia/widgets/display/empty.dart';
import 'package:flutter/material.dart';

// 弹出对话框
void showDialogBasic({
  required BuildContext context,
  required String title,
  double width = 500,
  double height = 500,
  Widget content = const Empty(),
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
            : Theme.of(context).scaffoldBackgroundColor,
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
                          color: Theme.of(context).dividerColor,
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
                              color:
                                  Theme.of(
                                    context,
                                  ).textTheme.titleMedium?.color ??
                                  Colors.black,
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
                              Theme.of(context).scaffoldBackgroundColor,
                            ),
                            overlayColor: WidgetStateProperty.all(
                              Theme.of(context).cardTheme.color,
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () {
                            onConfirm();
                            Navigator.pop(context);
                          },
                          child: Text(
                            confirm,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).textTheme.titleSmall?.color ??
                                  Colors.black54,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        // 取消按钮
                        TextButton(
                          onPressed: () {
                            onCancel();
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).scaffoldBackgroundColor,
                            ),
                            overlayColor: WidgetStateProperty.all(
                              Theme.of(context).cardTheme.color,
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
                              color:
                                  Theme.of(
                                    context,
                                  ).textTheme.titleSmall?.color ??
                                  Colors.black54,
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
