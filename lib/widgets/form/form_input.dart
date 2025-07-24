
import 'package:camellia/widgets/display/text_title.dart';
import 'package:flutter/material.dart' hide Title;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    super.key,
    this.title,
    required this.bindKey,
    this.isRequired = false,
    this.height = 50,
    this.initialValue = "",
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.titleFontSize = 12,
    this.isWarning = false,
    this.warningText = "",
    this.titleFontWeight = FontWeight.normal,
    this.focusNode,
    this.onChanged,
  });

  final String? title;
  final bool isRequired;
  final double height;
  final double titleFontSize;
  final FontWeight titleFontWeight;

  final FocusNode? focusNode;

  final bool? isWarning;
  final String? warningText;

  final Function(String?)? onChanged;

  // 只读
  final bool readOnly;

  // 最大行
  final int maxLines;

  // 最小行
  final int minLines;

  // 绑定到
  final String bindKey;

  final String initialValue;

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
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
        // 配置标题
        if (widget.title != null)
          TextTitle(
            title: widget.title!,
            fontWeight: widget.titleFontWeight,
            fontSize: widget.titleFontSize,
          ),
        // 配置内容
        FormBuilderTextField(
          name: widget.bindKey,
          onChanged: widget.onChanged ?? (value) {},
          // focusNode: widget.focusNode ?? FocusNode(),
          // controller: _controller,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          readOnly: widget.readOnly,

          style: TextStyle(
            fontSize: 13,

          ),
          cursorColor: Theme.of(context).primaryColor,
          cursorHeight: 15,
          cursorRadius: Radius.circular(10),
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Theme.of(context).iconTheme.color,
              
            ),
            hintStyle: TextStyle(
              color: Theme.of(context).iconTheme.color,
              
            ),
            isDense: true,
            errorMaxLines: 1,
            filled: true,
            // 选中的文本
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            focusColor: Theme.of(context).primaryColor,
            hoverColor: widget.readOnly
                ? Theme.of(context).colorScheme.primaryContainer.withAlpha(10)
                : Theme.of(context).primaryColor.withAlpha(10),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            // 选中时边框颜色
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: widget.readOnly
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            // 启用时边框颜色
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: (widget.isWarning ?? false)
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).inputDecorationTheme.border?.borderSide.color ?? Colors.black54,
                width: 1,
              ),
            ),
            // 禁用时边框颜色
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
          ),
          initialValue: widget.initialValue,
          validator: widget.isRequired
              ? FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: '必须指定${widget.title}的值',
                  ),
                ])
              : null,
        ),
      ],
    );
  }
}
