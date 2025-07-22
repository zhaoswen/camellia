import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 全局表单变量
class QFormDatas extends GetxController {
  final RxMap<String, QFormData> data = <String, QFormData>{}.obs;
}

class QFormData extends GetxController {
  List<QFormTextDataItem> items;

  QFormData({required this.items});
}

class QFormTextDataItem {
  // 当前字段的值
  var value = ''.obs;

  IconData? icon;
  Color iconColor;
  String title;
  String key;

  // QInputType type;

  // 高度
  double height;
  String placeholder;
  String defaultValue;
  String description;
  bool disabled;
  bool required;

  // TextEditingController 实例，需要将其绑定到 TextField 的 controller
  final TextEditingController textEditingController = TextEditingController();

  QFormTextDataItem({
    // 图标
    this.icon,
    // 图标颜色
    this.iconColor = Colors.black87,
    // 标题
    required this.title,
    // key
    required this.key,
    // 类型
    // required this.type,
    // 值变量
    // required this.value,
    // 高度
    this.height = 35,
    // 提示
    this.placeholder = "",
    // 默认值
    this.defaultValue = "",
    // 描述
    this.description = "",
    // 是否禁用
    this.disabled = false,
    // 是否必填
    this.required = false,
  });

  // @override
  // void onInit() {
  //   print("def --- > ${defaultValue} / ${this.defaultValue}");
  //   if (defaultValue.isNotEmpty){
  //     value.value = defaultValue;
  //   }
  //   // 初始化控制器的值
  //   textEditingController.text = value.value;
  //
  //   // 监听 TextField 的变化
  //   textEditingController.addListener(() {
  //     value.value = textEditingController.text;
  //   });
  // }
  //
  // @override
  // void onClose() {
  //   // 释放资源
  //   textEditingController.dispose();
  // }
}
