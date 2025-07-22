import 'package:camellia/shared/shared.dart';
import 'package:camellia/widgets/display/x_title.dart';
import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// 选择器组件（下拉框）
class Xselect extends StatefulWidget {
  final List<dynamic> options;
  final dynamic value;
  final ValueChanged<dynamic> onChanged;
  final String hintText;
  final String label;
  final double fontSize;
  final FontWeight fontWeight;
  final dynamic defaultValue;
  final bool disabled;

  // 后缀组件
  final Widget? suffixWidget;

  const Xselect({
    super.key,
    required this.options,
    this.value,
    this.hintText = "请选择",
    this.disabled = false,
    this.label = "",
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.defaultValue,
    required this.onChanged,
    this.suffixWidget,
  });

  @override
  State<Xselect> createState() => _XselectState();
}

class _XselectState extends State<Xselect> {
  late List<dynamic> _options; // 添加私有变量来存储 options 的副本
  List<String> selectedValue = [];

  @override
  void initState() {
    super.initState();
    _options = List.from(widget.options); // 初始化副本
  }

  void setSelectedValue(List<String> value) {
    setState(() => selectedValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.label != "")
          Xtitle(
            title: widget.label,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            Expanded(
              child: DropdownFlutter(
                enabled: !widget.disabled,
                hideSelectedFieldWhenExpanded: true,
                closedHeaderPadding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 3,
                  bottom: 3,
                ),
                initialItem: getDefault(),
                expandedHeaderPadding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 3,
                  bottom: 3,
                ),
                hintText: widget.hintText,
                disabledDecoration: CustomDropdownDisabledDecoration(
                  headerStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: setting.theme.value.fonts.family,
                    fontWeight: FontWeight.w400,
                    color: setting.theme.value.colors.subTitle.getColor(),
                  ),
                  fillColor: setting.theme.value.colors.background.getColor(),
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: setting.theme.value.fonts.family,
                    fontWeight: FontWeight.w400,
                    color: setting.theme.value.colors.subTitle.getColor(),
                  ),
                  suffixIcon: HugeIcon(
                    size: 13,
                    icon: HugeIcons.strokeRoundedArrowDown01,
                    color: setting.theme.value.colors.subTitle.getColor(),
                  ),
                ),
                decoration: CustomDropdownDecoration(
                  headerStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: setting.theme.value.fonts.family,
                    fontWeight: FontWeight.w400,
                    color: setting.theme.value.colors.subTitle.getColor(),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: setting.theme.value.fonts.family,
                    fontWeight: FontWeight.w400,
                    color: setting.theme.value.colors.subTitle.getColor(),
                  ),
                  listItemStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: setting.theme.value.fonts.family,
                    fontWeight: FontWeight.w400,
                    color: setting.theme.value.colors.subTitle.getColor(),
                  ),
                  closedBorderRadius: BorderRadius.circular(5),
                  expandedFillColor: setting.theme.value.colors.separator
                      .getColor(),
                  expandedBorderRadius: BorderRadius.circular(5),
                  closedFillColor: setting.theme.value.colors.background
                      .getColor(),
                  closedBorder: Border.all(
                    color: setting.theme.value.colors.inputBorder.getColor(),
                    width: 1,
                  ),
                  expandedBorder: Border.all(
                    color: setting.theme.value.colors.subTitle
                        .getColor()
                        .withAlpha(50),
                    width: 1,
                  ),
                  closedSuffixIcon: HugeIcon(
                    size: 13,
                    icon: HugeIcons.strokeRoundedArrowDown01,
                    color: setting.theme.value.colors.subTitle.getColor(),
                  ),
                  expandedSuffixIcon: HugeIcon(
                    size: 13,
                    icon: HugeIcons.strokeRoundedArrowUp01,
                    color: setting.theme.value.colors.subTitle.getColor(),
                  ),
                ),
                items: _options,
                // 使用副本
                onChanged: widget.onChanged,
              ),
            ),
            if (widget.suffixWidget != null)
              Container(child: widget.suffixWidget!),
          ],
        ),
      ],
    );
  }

  getDefault() {
    if (_options.contains(widget.defaultValue)) {
      return widget.defaultValue;
    } else {
      _options.add(widget.defaultValue); // 修改副本
      return widget.defaultValue;
    }
  }

  getOption() {}
}
