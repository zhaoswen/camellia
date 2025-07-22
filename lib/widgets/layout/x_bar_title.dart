import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:camellia/shared/shared.dart';
import 'package:camellia/widgets/operator/x_button_icon.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../entity/runtime/current.dart' as select;

class Xtitlebar extends StatefulWidget {
  const Xtitlebar({super.key});

  @override
  State<Xtitlebar> createState() => _XtitlebarState();
}

class _XtitlebarState extends State<Xtitlebar> {
  bool isMaximized = true;

  @override
  Widget build(BuildContext context) {
    // // 去掉，仅显示分割线
    // return Divider(
    //   height: 1,
    //   color: runtime.currentTheme.value.colors.separator.getColor(),
    // );
    // 仅macos有这个条，因为macos控制按钮显示在左侧，给它留一点空间需要
    return runtime.editMode.value
        ? WindowTitleBarBox(
            child: MoveWindow(
              child: Container(
                height: 30,
                // Macos下，向右控制80的区域，macos下控制按钮显示在左侧
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                decoration: BoxDecoration(
                  // 渐变背景（好像有点像IDEA，真不是抄袭。。。随便乱加的0.0）
                  // gradient: runtime.currentTheme.value.colors.titleBarBackground
                  // .getGradient(),
                  // 与其他背景色一致
                  color: setting.theme.value.colors.background.getColor(),
                  border: select.selectProductId.value != ""
                      ? Border(
                          bottom: BorderSide(
                            color: setting.theme.value.colors.separator
                                .getColor(),
                            width: 1,
                          ),
                        )
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 5,
                  children: [
                    !Platform.isMacOS
                        ? Text(
                            "2025.1",
                            style: TextStyle(
                              color: setting.theme.value.colors.subTitle
                                  .getColor(),
                              fontFamily: "gugi",
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          )
                        : Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 5,
                      children: [
                        // 窗口控制按钮
                        XIconButton(
                          iconSize: 12,
                          width: 18,
                          height: 18,
                          iconData: HugeIcons.strokeRoundedSolidLine01,
                          hoverColor: setting.theme.value.colors.primary
                              .getColor()
                              .withAlpha(50),
                          onPressed: () {
                            // 最小化
                            appWindow.minimize();
                          },
                        ),
                        // 窗口控制按钮
                        XIconButton(
                          iconSize: 12,
                          width: 18,
                          height: 18,
                          iconData: HugeIcons.strokeRoundedSquare,
                          hoverColor: setting.theme.value.colors.primary
                              .getColor()
                              .withAlpha(50),
                          onPressed: () {
                            // 最大化
                            appWindow.maximizeOrRestore();
                          },
                        ),
                        // 窗口控制按钮
                        XIconButton(
                          iconSize: 12,
                          width: 18,
                          height: 18,
                          iconData: HugeIcons.strokeRoundedCancel01,
                          hoverColor: setting.theme.value.colors.danger
                              .getColor()
                              .withAlpha(50),
                          onPressed: () {
                            // 关闭窗口
                            appWindow.close();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
