import 'package:flutter/material.dart';

class TextGradient extends StatefulWidget {
  const TextGradient({super.key,
    // 文本
    this.text = "Camellia UI",
    // 文本样式
    this.textStyle = const TextStyle(
      // 字体大小默认35
      fontSize: 35,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    this.commonColors = const [
      Color.fromARGB(255, 0, 128, 255),
      Color.fromARGB(255, 0, 64, 148)
    ],
    this.hoverColors = const [
      Color.fromARGB(255, 43, 0, 171),
      Color.fromARGB(255, 103, 38, 255)
    ]});

  final String text;
  final TextStyle textStyle;
  final List<Color> commonColors;
  final List<Color> hoverColors;

  @override
  State<TextGradient> createState() => _TextGradientState();
}

class _TextGradientState extends State<TextGradient>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _controller.forward();
          });
        },
        onExit: (event) {
          setState(() {
            _controller.reverse();
          });
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    Color.lerp(
                      widget.commonColors[0],
                      widget.hoverColors[0],
                      _animation.value,
                    )!,
                    Color.lerp(
                      widget.commonColors[1],
                      widget.hoverColors[1],
                      _animation.value,
                    )!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: Text(
                widget.text,
                style: widget.textStyle,
              ),
            );
          },
        ),
      ),
    );
  }
}
