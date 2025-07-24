import 'package:camellia/shared/shared.dart';
import 'package:flutter/cupertino.dart';

class Logger extends StatefulWidget {
  const Logger({super.key});

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
  State<Logger> createState() => _LoggerState();
}

class _LoggerState extends State<Logger> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: setting.theme.value.colors.subTitle.getColor().withAlpha(100),
        ),
        color: setting.theme.value.colors.parentBackground.getColor(),
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
                color: setting.theme.value.colors.primary.getColor(),
                fontSize: 12,
                fontFamily: setting.theme.value.fonts.family,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "[WARN] 2025-03-15 12:00:00 警告日志内容",
              style: TextStyle(
                color: setting.theme.value.colors.warning.getColor(),
                fontSize: 12,
                fontFamily: setting.theme.value.fonts.family,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "[SUCCESS] 2025-03-15 12:00:00 成功日志内容",
              style: TextStyle(
                color: setting.theme.value.colors.success.getColor(),
                fontSize: 12,
                fontFamily: setting.theme.value.fonts.family,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "[FAIL] 2025-03-15 12:00:00 错误日志内容",
              style: TextStyle(
                color: setting.theme.value.colors.danger.getColor(),
                fontSize: 12,
                fontFamily: setting.theme.value.fonts.family,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
