import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../shared/shared.dart';
import '../../../tools/logger.dart';

class LogConsole extends StatefulWidget {
  const LogConsole({super.key, required this.loggerObs});

  final RxList<dynamic> loggerObs;

  @override
  State<LogConsole> createState() => _LogConsoleState();
}

class _LogConsoleState extends State<LogConsole> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 15,
                      right: 15,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: SingleChildScrollView(
                      controller: _scrollController, // 添加控制器
                      child: Obx(() {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          // 在下一帧滚动到底部
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        });
                        return Column(
                          spacing: 10,
                          children: widget.loggerObs
                              .asMap()
                              .map((index, log) {
                                final (icon, color) = getIconAndColor(
                                  log.logType,
                                );
                                return MapEntry(
                                  index,
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: 13,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontFamily: setting
                                                .theme
                                                .value
                                                .fonts
                                                .family,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      HugeIcon(
                                        icon: icon,
                                        size: 12,
                                        color: color,
                                      ),
                                      Text(
                                        log.datetime.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily:
                                              setting.theme.value.fonts.family,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        // 方向
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          log.message,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: setting
                                                .theme
                                                .value
                                                .fonts
                                                .family,
                                            fontSize: 12,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Spacer(),
                                      Tooltip(
                                        message: log.message,
                                        child: HugeIcon(
                                          icon: HugeIcons
                                              .strokeRoundedInformationSquare,
                                          size: 12,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                              .values
                              .toList(),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  (IconData, Color) getIconAndColor(LogType logType) {
    switch (logType) {
      case LogType.error:
        return (HugeIcons.strokeRoundedCancel01, Colors.red);
      case LogType.info:
        return (HugeIcons.strokeRoundedArrowRightDouble, Colors.blue);
      case LogType.warning:
        return (HugeIcons.strokeRoundedAlert02, Colors.orange);
      case LogType.success:
        return (HugeIcons.strokeRoundedTick01, Colors.green);
      case LogType.operator:
        return (HugeIcons.strokeRoundedWorkflowSquare08, Colors.lightBlue);
      case LogType.debug:
        return (HugeIcons.strokeRoundedTick01, Colors.orangeAccent);
      case LogType.tip:
        return (
          HugeIcons.strokeRoundedFavourite,
          const Color.fromARGB(255, 255, 0, 0),
        );
    }
  }
}
