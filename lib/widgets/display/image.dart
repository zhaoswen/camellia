import 'package:flutter/cupertino.dart';

class Image extends StatelessWidget {
  const Image({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.radius = 5,
    this.fit = BoxFit.cover,
  });

  final String url;

  final double width;
  final double height;
  final double radius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(image: NetworkImage(url), fit: fit),
      ),
    );
  }
}
