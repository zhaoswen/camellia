// 获取主题
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../shared/shared.dart';

class Theme {
  // 颜色序列
  final ThemeColor colors;

  // 字体序列
  final ThemeFont fonts;

  // 图标序列
  final ThemeIcon icons;

  const Theme({
    this.colors = const ThemeColor(),
    this.fonts = const ThemeFont(),
    this.icons = const ThemeIcon(),
  });
}

class ThemeColor {
  // 强调色
  final MultistateColor primary;

  // 危险色
  final MultistateColor danger;

  // 警告色
  final MultistateColor warning;

  // 成功色
  final MultistateColor success;

  // 信息色
  final MultistateColor info;

  // 背景色
  final MultistateColor background;

  // 上级背景
  final MultistateColor parentBackground;

  // 标题颜色
  final MultistateColor title;

  // 副标题颜色
  final MultistateColor subTitle;

  // 文本色（普通文本，段落文本）
  final MultistateColor text;

  // 禁用色
  final MultistateColor disabled;

  // 分隔边框颜色
  final MultistateColor separator;

  // 普通图标颜色
  final MultistateColor standardIcon;

  // 标题栏背景
  final MultistateColor titleBarBackground;

  // 输入框背景色
  final MultistateColor inputBackground;

  // 输入框文本颜色
  final MultistateColor inputText;

  // 输入框边框颜色
  final MultistateColor inputBorder;

  // 输入框提示文本颜色
  final MultistateColor inputPlaceholder;

  const ThemeColor({
    this.primary = const MultistateColor(
      light: Color.fromARGB(255, 0, 110, 255),
      dark: Color.fromARGB(255, 0, 157, 255),
    ),
    this.danger = const MultistateColor(
      light: Color(0xff8f0006),
      dark: Color(0xff8f0006),
    ),
    this.warning = const MultistateColor(
      light: Color(0xfffaad14),
      dark: Color(0xfffaad14),
    ),
    this.success = const MultistateColor(
      light: Color(0xff52c41a),
      dark: Color(0xff52c41a),
    ),
    this.info = const MultistateColor(
      light: Color(0xff003a81),
      dark: Color(0xff195294),
    ),
    this.background = const MultistateColor(
      light: Color(0xffffffff),
      dark: Color(0xff212121),
    ),
    this.parentBackground = const MultistateColor(
      light: Color(0xfff0f0f0),
      dark: Color(0xff1f1f1f),
    ),
    this.title = const MultistateColor(
      light: Color(0xff1a1a1a),
      dark: Color(0xffeeeeee),
    ),
    this.subTitle = const MultistateColor(
      light: Color(0xff666666),
      dark: Color(0xff999999),
    ),
    this.text = const MultistateColor(
      light: Color(0xff333333),
      dark: Color(0xffcccccc),
    ),
    this.disabled = const MultistateColor(
      light: Color(0xff999999),
      dark: Color(0xff999999),
    ),
    this.inputBackground = const MultistateColor(
      light: Color(0xffffffff),
      dark: Color(0x3f3c3c3c),
    ),
    this.inputText = const MultistateColor(
      light: Color(0xff535353),
      dark: Color(0xffcccccc),
    ),
    this.inputBorder = const MultistateColor(
      light: Color(0xffd9d9d9),
      dark: Color(0xff333333),
    ),
    this.inputPlaceholder = const MultistateColor(
      light: Color(0xff999999),
      dark: Color(0xff999999),
    ),
    this.separator = const MultistateColor(
      light: Color(0xffededed),
      dark: Color(0xff333333),
    ),
    this.standardIcon = const MultistateColor(
      light: Color(0xff333333),
      dark: Color(0xffcccccc),
    ),
    this.titleBarBackground = const MultistateColor(),
  });
}

class ThemeFont {
  // 全局字体类型
  final String family;


  const ThemeFont({
    this.family = "",
  });
}

class ThemeIcon {
  // 代码视图图标
  final IconData codeView;

  // 蓝图视图图标
  final IconData blueprintView;

  // 轻代码视图图标
  final IconData lightCodeView;

  // 项目面板图标
  final IconData resourcePanel;

  // 组件面板图标
  final IconData compPanel;

  // 历史记录图标
  final IconData historyPanel;

  // 数据源图标
  final IconData datasourcePanel;

  // 控制台面板图标
  final IconData consolePanel;

  // 问题面板图标
  final IconData issuePanel;

  // 同步面板图标
  final IconData syncPanel;

  // 引擎面板图标
  final IconData enginePanel;

  // 消息面板图标
  final IconData messagePanel;

  // 属性面板图标
  final IconData attrPanel;

  // 人工智能面板图标
  final IconData aiPanel;

  // 设置按钮图标
  final IconData settingButton;

  // 市场按钮图标
  final IconData marketButton;

  // 返回工作空间按钮图标
  final IconData backButton;

  // 运行按钮图标
  final IconData runButton;

  // 停止按钮图标
  final IconData stopButton;

  // 编译按钮图标
  final IconData compileButton;

  // 打包按钮图标
  final IconData packageButton;

  // 刷新按钮图标
  final IconData refreshButton;

  // 更多按钮图标
  final IconData moreButton;

  // 打开项目按钮图标
  final IconData openProjectButton;

  // 创建项目按钮图标
  final IconData createProjectButton;

  // 刷新项目按钮图标
  final IconData refreshProjectButton;

  // 新增按钮图标
  final IconData addButton;

  // 蓝图图标
  final IconData blueprint;

  // 轻代码图标
  final IconData lightCode;

  // 代码图标
  final IconData code;

  // 保存按钮图标
  final IconData saveButton;

  // 删除按钮图标
  final IconData deleteButton;

  // 删除项目按钮图标
  final IconData deleteProjectButton;

  // 删除文件按钮图标
  final IconData deleteFileButton;

  // 夜间模式
  final IconData nightMode;

  // 日间模式
  final IconData dayMode;

  const ThemeIcon({
    this.resourcePanel = HugeIcons.strokeRoundedLicense,
    this.syncPanel = HugeIcons.strokeRoundedBookOpen02,
    this.compPanel = HugeIcons.strokeRoundedTools,
    this.datasourcePanel = HugeIcons.strokeRoundedDatabase,
    this.historyPanel = HugeIcons.strokeRoundedTimeQuarter,
    this.consolePanel = HugeIcons.strokeRoundedGreaterThanSquare,
    this.issuePanel = HugeIcons.strokeRoundedBug02,
    this.enginePanel = HugeIcons.strokeRoundedChip,
    this.messagePanel = HugeIcons.strokeRoundedMessage01,
    this.attrPanel = HugeIcons.strokeRoundedCells,
    this.aiPanel = HugeIcons.strokeRoundedAiChat02,
    this.settingButton = HugeIcons.strokeRoundedSetting07,
    this.marketButton = HugeIcons.strokeRoundedShopSign,
    this.backButton = HugeIcons.strokeRoundedHome09,
    this.runButton = HugeIcons.strokeRoundedCoffee02,
    this.codeView = HugeIcons.strokeRoundedCodeCircle,
    this.blueprintView = HugeIcons.strokeRoundedCompass01,
    this.lightCodeView = HugeIcons.strokeRoundedOrange,
    this.stopButton = HugeIcons.strokeRoundedFolder01,
    this.refreshButton = HugeIcons.strokeRoundedRefresh,
    this.moreButton = HugeIcons.strokeRoundedDragDrop,
    this.compileButton = HugeIcons.strokeRoundedCoffeeBeans,
    this.packageButton = HugeIcons.strokeRoundedPackage,
    this.openProjectButton = HugeIcons.strokeRoundedFolder01,
    this.createProjectButton = HugeIcons.strokeRoundedFolder01,
    this.refreshProjectButton = HugeIcons.strokeRoundedArrowReloadHorizontal,
    this.addButton = HugeIcons.strokeRoundedFolder01,
    this.blueprint = HugeIcons.strokeRoundedCompass01,
    this.lightCode = HugeIcons.strokeRoundedOrange,
    this.code = HugeIcons.strokeRoundedCodeCircle,
    this.saveButton = HugeIcons.strokeRoundedDownload05,
    this.deleteButton = HugeIcons.strokeRoundedDelete01,
    this.deleteProjectButton = HugeIcons.strokeRoundedFolder01,
    this.deleteFileButton = HugeIcons.strokeRoundedFolder01,
    this.nightMode = Icons.light_mode,
    this.dayMode = Icons.nightlight,
  });
}

// 多态颜色（有多种不同的颜色）
class MultistateColor {
  final Color light;
  final Color dark;
  final Gradient lightGradient;
  final Gradient darkGradient;

  // 根据运行时中的配置，返回不同的颜色
  Color getColor() {
    if (setting.darkMode.value) {
      return dark;
    } else {
      return light;
    }
  }

  // 获取反向颜色
  Color getReverseColor() {
    if (setting.darkMode.value) {
      return light;
    } else {
      return dark;
    }
  }

  getGradient() {
    if (setting.darkMode.value) {
      return darkGradient;
    } else {
      return lightGradient;
    }
  }

  const MultistateColor({
    this.light = Colors.black,
    this.dark = Colors.white,
    this.lightGradient = const LinearGradient(
      colors: [
        // Color.fromARGB(255, 240, 240, 240),
        Color.fromARGB(255, 187, 255, 187),
        Color.fromARGB(255, 220, 240, 255),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    this.darkGradient = const LinearGradient(
      colors: [
        Color.fromARGB(255, 0, 0, 0),
        Color.fromARGB(255, 0, 0, 80),
        Color.fromARGB(255, 0, 0, 0),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  });
}
