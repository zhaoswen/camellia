import 'package:flutter/material.dart';

// 单选框组组件
class XRadioGroup<T> extends StatefulWidget {
  final List<XRadioOption<T>> options;
  final T? value;
  final ValueChanged<T?> onChanged;

  const XRadioGroup({
    super.key,
    required this.options,
    this.value,
    required this.onChanged,
  });

  @override
  XRadioGroupState<T> createState() => XRadioGroupState<T>();
}

class XRadioGroupState<T> extends State<XRadioGroup<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.options.map((option) {
        return RadioListTile<T>(
          title: Text(option.label),
          value: option.value,
          groupValue: _selectedValue,
          onChanged: (T? newValue) {
            setState(() {
              _selectedValue = newValue;
              widget.onChanged(newValue);
            });
          },
        );
      }).toList(),
    );
  }
}

// 单选框选项类
class XRadioOption<T> {
  final T value;
  final String label;

  XRadioOption({required this.value, required this.label});
}
