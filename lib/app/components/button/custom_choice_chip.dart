import 'package:flutter/material.dart';

import '../../constants/other/padding_and_radius_size.dart';
import '../../theme/text_style/text_style.dart';


class CustomChoiceChip extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  final EdgeInsets? insidePadding;
  final double? borderWidth;
  const CustomChoiceChip({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isSelected, this.insidePadding, this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(radiusXXL),
            border: Border.all(color: isSelected ? Colors.transparent : Theme.of(context).colorScheme.onSurface,width: borderWidth ?? 1 )),
        child: Padding(
          padding: insidePadding ?? const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXXXS),
          child: Text(
            title,
            style: s16W500Dark.copyWith(color: isSelected ? Theme.of(context).colorScheme.surface : null),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
