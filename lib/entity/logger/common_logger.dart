import '../../tools/logger.dart';

class CommonLogger {
  // 日志类型
  LogType logType;

  // 日志内容
  String message;

  // 记录时间
  DateTime datetime;

  // 记录来源
  LogRecorder recorder;

  CommonLogger({
    required this.logType,
    required this.message,
    required this.datetime,
    required this.recorder,
  });

  @override
  String toString() {
    return '${datetime.toIso8601String()} [${logType.name}] $message';
  }
}
