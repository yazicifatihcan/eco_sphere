import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';


class ClickableText extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  const ClickableText({super.key, required this.onTap, this.padding, required this.text, this.textStyle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
          text,
          style: textStyle ?? s16W700Dark,
        ),
      ),
    );
  }
}
