import 'package:camellia/widgets/display/x_empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Xform extends StatefulWidget {
  const Xform({
    super.key,
    required this.formKey,
    required this.onChange,
    required this.children,
    this.emptyText = "暂无数据",
  });

  final Key formKey;

  // 回调
  final Function() onChange;

  // 空数据提示
  final String emptyText;

  // 子表单
  final List<Widget> children;

  @override
  State<Xform> createState() => _XformState();
}

class _XformState extends State<Xform> {
  @override
  Widget build(BuildContext context) {
    return widget.children.isEmpty
        ? XEmpty(text: widget.emptyText)
        : FormBuilder(
            onChanged: widget.onChange,
            key: widget.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 10,
                children: widget.children,
              ),
            ),
          );
  }
}
