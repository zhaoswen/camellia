import 'package:flutter/material.dart';

import '../../../entity/common.dart';

/// 分割线组件
///
/// 用于在界面中添加分割线
///
/// [direction] 分割线方向，默认为水平
///
/// [width] 分割线宽度，默认为1
///
/// [height] 分割线高度，默认为1
///
/// [color] 分割线颜色，默认为Colors.black12
///
/// 示例：Divider(direction: Direction.horizontal, color: Colors.red)
class XDivider extends StatelessWidget {
  /// 分割线方向，默认为水平
  ///
  /// 分割线宽度，默认为1
  ///
  /// 分割线高度，默认为1
  ///
  /// 分割线颜色，默认为Colors.black12
  const XDivider({
    super.key,
    required this.direction,
    this.width = 1,
    this.height = 1,
    this.color = Colors.black12,
  });

  /// 分割线方向
  final Direction direction;

  /// 分割线宽度
  final double width;

  /// 分割线高度
  final double height;

  /// 分割线颜色
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: direction == Direction.horizontal ? double.infinity : width,
      height: direction == Direction.vertical ? double.infinity : height,
      decoration: BoxDecoration(
        border: direction == Direction.horizontal
            ? Border(
                bottom: BorderSide(color: color, width: height),
              )
            : Border(
                right: BorderSide(color: color, width: width),
              ),
      ),
    );
  }
}
