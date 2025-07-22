import 'package:camellia/entity/logger/common_logger.dart';
import 'package:logger/logger.dart';

import '../entity/runtime/logger.dart' as logger;

var consoleLogger = Logger(
  // filter: null, // Use the default LogFilter (-> only log in debug mode)
  printer: PrettyPrinter(
    methodCount: 0,
    dateTimeFormat: DateTimeFormat.dateAndTime,
  ), // Use the PrettyPrinter to format and print log
);

log(LogType logType, String message, LogRecorder recorder) {
  switch (logType) {
    case LogType.error:
      logger.errorLogStack.add(
        CommonLogger(
          logType: logType,
          message: message,
          datetime: DateTime.now(),
          recorder: recorder,
        ),
      );
      consoleLogger.e(message);
      return;
    case LogType.warning:
      logger.errorLogStack.add(
        CommonLogger(
          logType: logType,
          message: message,
          datetime: DateTime.now(),
          recorder: recorder,
        ),
      );
      consoleLogger.w(message);
      return;
    case LogType.info:
      logger.commonLogStack.add(
        CommonLogger(
          logType: logType,
          message: message,
          datetime: DateTime.now(),
          recorder: recorder,
        ),
      );
      consoleLogger.i(message);
      return;
    case LogType.success:
      logger.commonLogStack.add(
        CommonLogger(
          logType: logType,
          message: message,
          datetime: DateTime.now(),
          recorder: recorder,
        ),
      );
      consoleLogger.i(message);
      return;
    case LogType.debug:
      logger.commonLogStack.add(
        CommonLogger(
          logType: logType,
          message: message,
          datetime: DateTime.now(),
          recorder: recorder,
        ),
      );
      consoleLogger.d(message);
      return;
    case LogType.tip:
      logger.commonLogStack.add(
        CommonLogger(
          logType: logType,
          message: message,
          datetime: DateTime.now(),
          recorder: recorder,
        ),
      );
      consoleLogger.i(message);
      return;
    case LogType.operator:
      logger.operatorLogStack.add(
        CommonLogger(
          logType: logType,
          message: message,
          datetime: DateTime.now(),
          recorder: recorder,
        ),
      );
      consoleLogger.i(message);
      return;
  }
}

enum LogType {
  // 错误
  error,
  // 警告
  warning,
  // 操作
  operator,
  // 信息
  info,
  // 成功
  success,
  // 调试
  debug,
  // 提示
  tip;

  @override
  String toString() {
    return name;
  }
}

enum LogRecorder {
  // 核心初始化
  init,
  // API请求时
  api,
  // 界面渲染
  ui,
  // 服务流转控制
  controller,
  // 抽象器
  abstraction,
  // 具象器
  concrete,
  // 操作器
  operator,
  // 插件
  plugin,

  // 其他情况
  other;

  @override
  String toString() {
    return name;
  }
}
