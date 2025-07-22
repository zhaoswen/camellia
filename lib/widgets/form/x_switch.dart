import 'package:camellia/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../display/x_title.dart';

// 开关组件
class XSwitch extends StatefulWidget {
  final bool value;
  final String title;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final ValueChanged<dynamic> onChanged;

  const XSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.title = '',
    this.titleFontSize = 12,
    this.titleFontWeight = FontWeight.normal,
  });

  @override
  XSwitchState createState() => XSwitchState();
}

class XSwitchState extends State<XSwitch> {
  final _controller00 = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Xtitle(
          title: widget.title,
          fontWeight: widget.titleFontWeight,
          fontSize: widget.titleFontSize,
        ),
        SizedBox(
          child: AdvancedSwitch(
            width: 40,
            height: 20,
            borderRadius: BorderRadius.circular(20),
            activeColor: setting.theme.value.colors.primary.getColor(),
            inactiveColor: setting.theme.value.colors.parentBackground
                .getReverseColor()
                .withAlpha(100),
            controller: _controller00,
            initialValue: widget.value,
            onChanged: widget.onChanged,
            thumb: ValueListenableBuilder<bool>(
              valueListenable: _controller00,
              builder: (_, value, __) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: setting.theme.value.colors.background.getColor(),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
