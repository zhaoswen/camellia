import 'package:camellia/shared/shared.dart';
import 'package:camellia/tools/logger.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// Message 更适合桌面端
class MessageOverlay {
  static final List<OverlayEntry> _entries = [];

  static void showMessage(
    String message, {
    String title = "提示",
    // 位置
    Alignment alignment = Alignment.topRight,
    // 类型
    MessageType type = MessageType.info,
    // 持续时间，默认3秒
    int duration = 3,
    // 宽度
    double width = 300,
    // 高度
    double height = 70,
    // 自动移除
    bool autoRemove = true,
    // 整体偏移 X 轴
    double offsetX = 45,
    // 整体偏移 Y 轴
    double offsetY = 35,
    // 堆叠偏移 x 轴
    double stackOffsetX = 3,
    // 堆叠偏移 y 轴
    double stackOffsetY = 3,
    BuildContext? context,
  }) {
    final overlay = Overlay.of(context!);
    final position = _calculatePosition(
      alignment,
      _entries.length,
      offsetX: offsetX,
      offsetY: offsetY,
      stackOffsetX: stackOffsetX,
      stackOffsetY: stackOffsetY,
    );

    // 提前声明 entry 变量
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: position['top'],
          bottom: position['bottom'],
          right: position['right'],
          left: position['left'],
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(13.0),
                //   child: BackdropFilter(
                //     filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(13.0),
                //         // color: setting.theme.value.colors.background
                //         //     .getColor()
                //         //     .withAlpha(250),
                //         border: Border.all(
                //           color: setting.theme.value.colors.subTitle
                //               .getColor()
                //               .withAlpha(100),
                //           width: 0.5,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                      color: setting.theme.value.colors.background.getColor(),
                      borderRadius: BorderRadius.circular(13.0),
                      border: Border.all(
                        color: setting.theme.value.colors.subTitle
                            .getColor()
                            .withAlpha(100),
                        width: 0.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: setting.theme.value.colors.subTitle
                              .getColor()
                              .withAlpha(50),
                          blurRadius: 5.0,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 5,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 5,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 13.0,
                                color: getMainColor(type),
                                decoration: TextDecoration.none,
                                fontFamily: setting.theme.value.fonts.family,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                              height: 15,
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                splashRadius: 1,
                                onPressed: () {
                                  entry.remove();
                                  _entries.remove(entry);
                                },
                                icon: HugeIcon(
                                  icon: HugeIcons.strokeRoundedClean,
                                  size: 13,
                                  color: setting.theme.value.colors.primary
                                      .getColor(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          message,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: setting.theme.value.colors.title.getColor(),
                            decoration: TextDecoration.none,
                            fontFamily: setting.theme.value.fonts.family,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    _entries.add(entry);
    overlay.insert(entry);

    // 自动移除提示框
    Future.delayed(Duration(seconds: duration), () {
      if (autoRemove) {
        try {
          entry.remove();

          _entries.remove(entry);
        } catch (e) {
          log(LogType.warning, "侦测到非异常错误，提示框被手动移除", LogRecorder.ui);
        }
      }
    });
  }

  static Map<String, double?> _calculatePosition(
    Alignment alignment,
    int entryCount, {
    // 整体偏移 X 轴
    double offsetX = 35,
    // 整体偏移 Y 轴
    double offsetY = 35,
    // 堆叠偏移 x 轴
    double stackOffsetX = 3,
    // 堆叠偏移 y 轴
    double stackOffsetY = 3,
  }) {
    double? top, bottom, right, left;
    if (alignment == Alignment.topRight || alignment == Alignment.topLeft) {
      top = offsetY + entryCount * stackOffsetY;
    } else if (alignment == Alignment.bottomRight ||
        alignment == Alignment.bottomLeft) {
      bottom = offsetY + entryCount * stackOffsetY;
    }
    if (alignment == Alignment.bottomRight || alignment == Alignment.topRight) {
      right = offsetX + entryCount * stackOffsetX;
    } else if (alignment == Alignment.bottomLeft ||
        alignment == Alignment.topLeft) {
      left = offsetX + entryCount * stackOffsetX;
    }
    return {'top': top, 'bottom': bottom, 'right': right, 'left': left};
  }

  static Color getMainColor(MessageType type) {
    switch (type) {
      case MessageType.success:
        return setting.theme.value.colors.success.getColor();
      case MessageType.error:
        return setting.theme.value.colors.danger.getColor();
      case MessageType.warning:
        return setting.theme.value.colors.warning.getColor();
      case MessageType.info:
        return setting.theme.value.colors.primary.getColor();
    }
  }
}

// // 没BuildContext的情况
// showMessage(String message) {
//   // 假设你有一个 BuildContext，这里使用 GlobalKey 来获取
//   MessageOverlay.showMessage(message);
// }

enum MessageType { success, error, warning, info }
