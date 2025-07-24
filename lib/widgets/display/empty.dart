import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../shared/shared.dart';

// 空状态组件
class Empty extends StatelessWidget {
  const Empty({
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
                color: setting.theme.value.colors.subTitle.getColor().withAlpha(
                  50,
                ),
              )
            else if (child != null)
              child!,
            if (child == null)
              Text(
                text,
                style: TextStyle(
                  color: setting.theme.value.colors.subTitle
                      .getColor()
                      .withAlpha(200),
                  fontFamily: setting.theme.value.fonts.family,
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
