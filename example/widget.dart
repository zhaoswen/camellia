import 'package:camellia/widgets/operator/link_text.dart';
import 'package:flutter/cupertino.dart';

class DemoView extends StatelessWidget {
  const DemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return TextLink(
      onPressed: () {
        // implement build
      },
      text: "Click me",
    );
  }
}
