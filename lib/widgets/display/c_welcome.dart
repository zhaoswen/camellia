import 'package:flutter/material.dart';

class CWelcome extends StatefulWidget {
  const CWelcome({super.key});

  @override
  State<CWelcome> createState() => _CWelcomeState();
}

class _CWelcomeState extends State<CWelcome>
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
    var commonColors = [
      const Color.fromARGB(255, 0, 128, 255),
      const Color.fromARGB(255, 0, 64, 148),
    ];
    var hoverColors = [
      const Color.fromARGB(255, 43, 0, 171),
      const Color.fromARGB(255, 103, 38, 255),
    ];

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
                      commonColors[0],
                      hoverColors[0],
                      _animation.value,
                    )!,
                    Color.lerp(
                      commonColors[1],
                      hoverColors[1],
                      _animation.value,
                    )!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: Text(
                "Stardust Hub",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "dingtalk",
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
