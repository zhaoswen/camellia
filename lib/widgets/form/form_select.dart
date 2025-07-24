import 'package:camellia/widgets/display/text_title.dart';
import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// 选择器组件（下拉框）
class FormSelect extends StatefulWidget {
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

  const FormSelect({
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
  State<FormSelect> createState() => _FormSelectState();
}

class _FormSelectState extends State<FormSelect> {
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
          TextTitle(
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

                    fontWeight: FontWeight.w400,
                    color:
                        Theme.of(context).textTheme.titleSmall?.color ??
                        Colors.black54,
                  ),
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  hintStyle: TextStyle(
                    fontSize: 12,

                    fontWeight: FontWeight.w400,
                    color:
                        Theme.of(context).textTheme.titleSmall?.color ??
                        Colors.black54,
                  ),
                  suffixIcon: HugeIcon(
                    size: 13,
                    icon: HugeIcons.strokeRoundedArrowDown01,
                    color:
                        Theme.of(context).textTheme.titleSmall?.color ??
                        Colors.black54,
                  ),
                ),
                decoration: CustomDropdownDecoration(
                  headerStyle: TextStyle(
                    fontSize: 12,

                    fontWeight: FontWeight.w400,
                    color:
                        Theme.of(context).textTheme.titleSmall?.color ??
                        Colors.black54,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 12,

                    fontWeight: FontWeight.w400,
                    color:
                        Theme.of(context).textTheme.titleSmall?.color ??
                        Colors.black54,
                  ),
                  listItemStyle: TextStyle(
                    fontSize: 12,

                    fontWeight: FontWeight.w400,
                    color:
                        Theme.of(context).textTheme.titleSmall?.color ??
                        Colors.black54,
                  ),
                  closedBorderRadius: BorderRadius.circular(5),
                  expandedFillColor: Theme.of(context).dividerColor,
                  expandedBorderRadius: BorderRadius.circular(5),
                  closedFillColor: Theme.of(context).scaffoldBackgroundColor,
                  closedBorder: Border.all(
                    color:
                        Theme.of(
                          context,
                        ).inputDecorationTheme.border?.borderSide.color ??
                        Colors.black54,
                    width: 1,
                  ),
                  expandedBorder: Border.all(
                    color:
                        Theme.of(context).textTheme.titleSmall?.color ??
                        Colors.black54.withAlpha(50),
                    width: 1,
                  ),
                  closedSuffixIcon: HugeIcon(
                    size: 13,
                    icon: HugeIcons.strokeRoundedArrowDown01,
                    color:
                        Theme.of(context).textTheme.titleSmall?.color ??
                        Colors.black54,
                  ),
                  expandedSuffixIcon: HugeIcon(
                    size: 13,
                    icon: HugeIcons.strokeRoundedArrowUp01,
                    color:
                        Theme.of(context).textTheme.titleSmall?.color ??
                        Colors.black54,
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
