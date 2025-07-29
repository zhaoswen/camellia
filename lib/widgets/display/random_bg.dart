import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

// 随机渐变化背景
// 这玩意可能有点消耗性能，已知改变窗口大小会导致频闪
class XRandomBackground extends StatefulWidget {
  const XRandomBackground({
    super.key,
    required this.child,
    this.blur = 100,
    this.backgroundColors = const [Color(0x34FFFFFF), Color(0x34FFFFFF)],
    this.circleColors = const [Color(0xFF03A7FF), Color(0xFF006375)],
  });

  // 子组件（此组件显示在最上层）
  final Widget child;

  // 模糊强度
  final double blur;

  // 背景颜色（渐变）
  final List<Color> backgroundColors;
  // 圆渐变
  final List<Color> circleColors;
  // 圆基础大小
  final double circleBaseSize = 500;

  //

  @override
  State<XRandomBackground> createState() => _XRandomBackgroundState();
}

class _XRandomBackgroundState extends State<XRandomBackground> {
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 模糊背景
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.backgroundColors,
            ),
          ),
        ),
        // 随机生成的模糊圆形
        ...List.generate(5, (index) => _buildBlurCircle()),
        // 模糊效果
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: widget.blur, sigmaY: widget.blur),

          child: Container(color: Colors.transparent),
        ),
        // 子组件显示在最上层
        widget.child,
      ],
    );
  }

  Widget _buildBlurCircle() {
    final size = MediaQuery.of(context).size;
    final circleSize = _random.nextDouble() * widget.circleBaseSize;
    final x = _random.nextDouble() * size.width - 50;
    final y = _random.nextDouble() * size.height - 50;

    return Positioned(
      left: x,
      top: y,
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget.circleColors,
          ),
        ),
      ),
    );
  }
}
