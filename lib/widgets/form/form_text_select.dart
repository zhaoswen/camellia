import 'package:camellia/shared/shared.dart';
import 'package:camellia/widgets/display/text_title.dart';
import 'package:camellia/widgets/operator/search.dart';
import 'package:camellia/widgets/layout/view_tab.dart';
import 'package:camellia/widgets/operator/button_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../layout/dialog_basic.dart';

class FormTextSelect extends StatefulWidget {
  const FormTextSelect({
    super.key,
    required this.title,
    required this.bindKey,
    this.isRequired = false,
    this.height = 40,
    this.initialValue = "",
    required this.options,
    this.onSelect,
    this.onClean,
  });

  final String title;
  final bool isRequired;
  final double height;
  final List<XFormTextSelectClass> options;

  // 当用户选择了数据
  final Function(String)? onSelect;

  // 当用户清除了选择
  final Function()? onClean;

  // 绑定
  final String bindKey;

  final String initialValue;

  @override
  State<FormTextSelect> createState() => _FormTextSelectState();
}

class _FormTextSelectState extends State<FormTextSelect> {
  var currentSelect = "";

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormBuilderFieldState>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 配置标题
        TextTitle(title: widget.title, fontSize: 14),
        // 配置内容
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: widget.bindKey,
                  key: key,
                  readOnly: true,
                  style: TextStyle(
                    fontSize: 13,
                    color: setting.theme.value.colors.inputText.getColor(),
                    fontFamily: setting.theme.value.fonts.family,
                  ),
                  cursorColor: setting.theme.value.colors.primary.getColor(),
                  cursorHeight: 15,
                  cursorErrorColor: setting.theme.value.colors.danger
                      .getColor(),
                  cursorRadius: Radius.circular(10),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: setting.theme.value.colors.standardIcon.getColor(),
                      fontFamily: setting.theme.value.fonts.family,
                    ),
                    hintStyle: TextStyle(
                      color: setting.theme.value.colors.standardIcon.getColor(),
                      fontFamily: setting.theme.value.fonts.family,
                    ),
                    isDense: true,
                    errorMaxLines: 1,
                    filled: true,
                    fillColor: setting.theme.value.colors.inputBackground
                        .getColor(),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    // 选中时边框颜色
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: setting.theme.value.colors.primary.getColor(),
                        width: 1,
                      ),
                    ),
                    // 启用时边框颜色
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: setting.theme.value.colors.inputBorder
                            .getColor(),
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
              ),
              SizedBox(width: 5),
              SizedBox(
                height: 27,
                child: ButtonText(
                  width: 55,
                  onPressed: () async => {
                    showDialogBasic(
                      context: context,
                      header: Search(hintText: '输入关键字'),
                      title: '选择处理器',
                      width: 800,
                      onConfirm: () {
                        key.currentState!.didChange(currentSelect);
                        // key.currentState!.setState(() {
                        // });
                        if (widget.onSelect != null) {
                          widget.onSelect!(currentSelect);
                        }
                      },
                      onCancel: () {
                        if (widget.onClean != null) {
                          widget.onClean!();
                        }
                      },
                      content: SizedBox(
                        height: 400,
                        child: ViewTab(
                          tabs: makeTab(widget.options),
                          spacing: 10,
                        ),
                      ),
                    ),
                  },
                  text: '选择',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<TabItem> makeTab(List<XFormTextSelectClass> options) {
    List<TabItem> tabs = [];
    for (XFormTextSelectClass option in options) {
      tabs.add(
        TabItem(
          title: option.label,
          content: ListView.builder(
            itemCount: option.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                titleTextStyle: TextStyle(
                  color: setting.theme.value.colors.title.getColor(),
                  fontFamily: setting.theme.value.fonts.family,
                  fontSize: 13,
                ),
                subtitleTextStyle: TextStyle(
                  color: setting.theme.value.colors.subTitle.getColor(),
                  fontFamily: setting.theme.value.fonts.family,
                  fontSize: 11,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                title: Text(option.items[index].label),
                subtitle: Text(option.items[index].description),
                onTap: () {
                  // 触发选择事件
                  currentSelect = option.items[index].key;
                },
              );
            },
          ),
        ),
      );
    }
    return tabs;
  }
}

// 分类列表
class XFormTextSelectClass {
  // 标签
  final String label;

  // 下级列表
  final List<XFormTextSelectClassItem> items;

  XFormTextSelectClass({required this.label, this.items = const []});
}

// 列表项
class XFormTextSelectClassItem {
  // 名称
  final String label;

  // 唯一标识
  final String key;

  // 描述信息
  final String description;

  XFormTextSelectClassItem(this.key, {this.label = "", this.description = ""});
}
