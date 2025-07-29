import 'package:flutter/material.dart';

class XLogger extends StatefulWidget {
  const XLogger({super.key});

  // 日志内容

  // 最大行数限制

  // 最大字数限制

  // 超限动作

  // 警告标志

  // 错误标志

  // 成功标志

  // 提示标志

  // 警告颜色

  // 错误颜色

  // 成功颜色

  // 提示颜色

  @override
  State<XLogger> createState() => _XLoggerState();
}

class _XLoggerState extends State<XLogger> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color:
              Theme.of(context).textTheme.titleSmall?.color ??
              Colors.black54.withAlpha(100),
        ),
        color: Theme.of(context).cardTheme.color,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Text(
              "[INFO] 2025-03-15 12:00:00 默认日志内容",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,

                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "[WARN] 2025-03-15 12:00:00 警告日志内容",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "[SUCCESS] 2025-03-15 12:00:00 成功日志内容",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 12,

                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "[FAIL] 2025-03-15 12:00:00 错误日志内容",
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
