import 'package:camellia/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';

class Search extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onSubmitted;

  const Search({super.key, required this.hintText, this.onSubmitted});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
        color: setting.theme.value.colors.subTitle.getColor(),
        size: 13,
      ),
      style: TextStyle(
        fontSize: 13,
        fontFamily: setting.theme.value.fonts.family,
        color: setting.theme.value.colors.subTitle.getColor(),
      ),
      cursorHeight: 12,
      cursorColor: setting.theme.value.colors.primary.getColor(),
      cursorRadius: Radius.circular(5),
      decoration: BoxDecoration(
        color: setting.theme.value.colors.inputBackground.getColor(),
        border: Border.all(
          color: setting.theme.value.colors.separator.getColor(),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
    );
  }
}
