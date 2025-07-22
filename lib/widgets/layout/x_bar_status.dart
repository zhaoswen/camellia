import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../entity/runtime/current.dart' as select;
import '../../../generated/l10n.dart';
import '../../../shared/shared.dart';

class Xstatusbar extends StatefulWidget {
  const Xstatusbar({super.key});

  @override
  State<Xstatusbar> createState() => _XstatusbarState();
}

class _XstatusbarState extends State<Xstatusbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 25,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: setting.theme.value.colors.separator.getColor(),
            width: 1,
          ),
        ),
        color: setting.theme.value.colors.background.getColor(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 5,
        children: [
          // 图标
          Obx(
            () => HugeIcon(
              icon: runtime.editMode.value
                  ? HugeIcons.strokeRoundedEdit01
                  : HugeIcons.strokeRoundedManager,
              color: setting.theme.value.colors.subTitle.getColor(),
              size: 10,
            ),
          ),
          // 文字
          Obx(
            () => Text(
              runtime.editMode.value ? S.current.design : S.current.manage,
              style: TextStyle(
                color: setting.theme.value.colors.subTitle.getColor(),
                fontFamily: setting.theme.value.fonts.family,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          // 许可证
          Obx(
            () => Text(
              "/ ${S.current.app_license}",
              style: TextStyle(
                color: setting.theme.value.colors.subTitle.getColor(),
                fontFamily: setting.theme.value.fonts.family,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Spacer(),

          Obx(
            () => Text(
              !runtime.saved.value ? " (${S.current.no_save}) " : "",
              style: TextStyle(
                color: setting.theme.value.colors.warning.getColor(),
                fontFamily: setting.theme.value.fonts.family,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Obx(
            () => Text(
              select.selectProductId.value == ""
                  ? S.current.no_status
                  : "${select.selectProductName.value} [ ${select.selectProductId.value} ]",
              style: TextStyle(
                color: setting.theme.value.colors.subTitle.getColor(),
                fontFamily: setting.theme.value.fonts.family,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          // SizedBox(width: 15),
          Obx(
            () => Text(
              select.selectVersionId.value == ""
                  ? ""
                  : " : ${select.selectVersionId.value}",
              style: TextStyle(
                color: setting.theme.value.colors.subTitle.getColor(),
                fontFamily: setting.theme.value.fonts.family,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
