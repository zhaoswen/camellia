import 'package:camellia/shared/shared.dart';
import 'package:flutter/material.dart';

// 全屏对话框（独占）
Future<void> showXDialogFull(
  BuildContext context,
  // 对话框标题
  String title,
  // 对话框主体
  Widget content,
  // 对话框按钮组
  List<Widget> footer,
) async {
  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: setting.theme.value.colors.background.getColor(), // 背景颜色
              child: SafeArea(
                child: Column(
                  children: [
                    // 标题栏
                    // TitleBar(),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 10, 20, 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: setting.theme.value.colors.separator
                                .getColor(),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: setting.theme.value.colors.title
                                  .getColor(),
                              fontFamily: setting.theme.value.fonts.family,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 主内容
                    Expanded(child: content),
                    // 底部控制栏
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: setting.theme.value.colors.separator
                                .getColor(),
                            width: 1,
                          ),
                        ),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: footer,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
