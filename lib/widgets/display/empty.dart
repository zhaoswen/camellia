import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// 空状态组件
class XEmpty extends StatelessWidget {
  const XEmpty({
    super.key,
    this.text = "暂无数据",
    this.showIcon = false,
    this.size = 12,
    this.child,
    this.icon = HugeIcons.strokeRoundedSecondBracketSquare,
  });

  final String text;
  final IconData icon;
  final double size;
  final bool showIcon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      // color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            if (showIcon)
              HugeIcon(
                icon: icon,
                size: 40,
                color:
                    Theme.of(context).textTheme.titleSmall?.color ??
                    Colors.black54.withAlpha(50),
              )
            else if (child != null)
              child!,
            if (child == null)
              Text(
                text,
                style: TextStyle(
                  color:
                      Theme.of(context).textTheme.titleSmall?.color ??
                      Colors.black54.withAlpha(200),

                  fontWeight: FontWeight.normal,
                  fontSize: size,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
