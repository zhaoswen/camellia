import 'package:camellia/widgets/display/x_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../shared/shared.dart';
import '../layout/dialog_basic.dart';
import '../operator/x_button_icon.dart';
import 'c_input.dart';

class XMapEditor extends StatefulWidget {
  const XMapEditor({
    super.key,
    required this.title,
    required this.onCommit,
    this.icon,
    this.getInitData,
    // this.initData
  });

  // 按钮标题
  final String title;

  // 按钮图标
  final IconData? icon;

  // 按钮回调
  final Function(Map<dynamic, dynamic>) onCommit;

  // 初始化数据
  // final Map<String, dynamic>? initData;

  // 如果是动态的数据
  final Map<String, dynamic>? Function()? getInitData;

  @override
  State<XMapEditor> createState() => _XMapEditorState();
}

class _XMapEditorState extends State<XMapEditor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          side: WidgetStateProperty.all(
            BorderSide(
              color: setting.theme.value.colors.subTitle.getColor().withAlpha(
                150,
              ),
              width: 1,
            ),
          ),
          overlayColor: WidgetStateProperty.all(
            setting.theme.value.colors.separator.getColor(),
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(
            setting.theme.value.colors.title.getColor(),
          ),
          textStyle: WidgetStateProperty.all(
            TextStyle(
              fontSize: 12,
              color: setting.theme.value.colors.subTitle.getColor(),
              fontFamily: setting.theme.value.fonts.family,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(
            setting.theme.value.colors.background.getColor(),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        onPressed: () {
          showInputListDialog();
        },
        child: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.icon != null)
              Icon(
                widget.icon,
                size: 13,
                color: setting.theme.value.colors.subTitle.getColor(),
              ),
            Text(widget.title),
          ],
        ),
      ),
    );
  }

  showInputListDialog() {
    RxMap<String, dynamic> map = RxMap();
    var keyFocusNodes = [];
    var keyName = "";
    // var oldKeyName = "";
    if (widget.getInitData != null) {
      var data = widget.getInitData!();
      for (var element in data!.keys) {
        map[element] = data[element];
      }
    }
    showXDialogBasic(
      context: context,
      title: widget.title,
      header: XIconButton(
        iconData: HugeIcons.strokeRoundedAddSquare,
        onPressed: () {
          map["key"] = "value";
        },
      ),
      content: Center(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: map.keys
                  .toList()
                  .asMap()
                  .map((index, key) {
                    var keyFocusNode = FocusNode();
                    keyFocusNode.addListener(() {
                      if (keyFocusNode.hasFocus) {
                        // oldKeyName = key;
                      } else {
                        if (keyName == "") {
                          MessageOverlay.showMessage(
                            "参数名不能为空！",
                            context: context,
                            duration: 1,
                            type: MessageType.warning,
                          );
                        } else if (map.containsKey(keyName)) {
                          // 判断是否已经有了这个key
                          MessageOverlay.showMessage(
                            "重复的参数名，请重新修改！",
                            context: context,
                            duration: 1,
                            type: MessageType.warning,
                          );
                          print("object ${keyName} in ${map}");
                        } else {
                          print("asaa");
                          // 记录value的值
                          var old = map[key];
                          // 删除旧key
                          map.remove(key);
                          // 新加
                          map[keyName] = old;
                        }
                      }
                    });
                    keyFocusNodes.add(keyFocusNode);
                    return MapEntry(
                      index,
                      Container(
                        height: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: setting.theme.value.colors.parentBackground
                              .getColor(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Expanded(
                              flex: 3,
                              child: CInput(
                                bindKey: 'name',
                                focusNode: keyFocusNodes[index],
                                initialValue: key,
                                onChanged: (val) {
                                  keyName = val!;
                                },
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: CInput(
                                bindKey: 'value',
                                initialValue: map[key] ?? "",
                                onChanged: (val) {
                                  map[key] = val;
                                },
                              ),
                            ),
                            XIconButton(
                              backgroundColor: setting
                                  .theme
                                  .value
                                  .colors
                                  .background
                                  .getColor(),
                              height: 25,
                              width: 25,
                              iconSize: 12,
                              onPressed: () {
                                setState(() {
                                  map.remove(key);
                                });
                              },
                              iconData: HugeIcons.strokeRoundedDelete02,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          ),
        ),
      ),
      onConfirm: () {
        widget.onCommit(map);
      },
      onCancel: () {
        map.clear();
      },
    );
  }
}
