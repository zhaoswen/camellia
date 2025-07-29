import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class XSearch extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onSubmitted;

  const XSearch({super.key, required this.hintText, this.onSubmitted});

  @override
  State<XSearch> createState() => _XSearchState();
}

class _XSearchState extends State<XSearch> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _controller,
      placeholder: widget.hintText,
      onSubmitted: widget.onSubmitted,
      prefix: HugeIcon(
        icon: HugeIcons.strokeRoundedSearch01,
        color: Theme.of(context).textTheme.titleSmall?.color ?? Colors.black54,
        size: 13,
      ),
      style: TextStyle(
        fontSize: 13,

        color: Theme.of(context).textTheme.titleSmall?.color ?? Colors.black54,
      ),
      cursorHeight: 12,
      cursorColor: Theme.of(context).primaryColor,
      cursorRadius: Radius.circular(5),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
    );
  }
}
