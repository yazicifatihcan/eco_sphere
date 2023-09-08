import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';

import '../../constants/other/padding_and_radius_size.dart';

class DotIndicator extends StatelessWidget {
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double? unSelectedRadius;
  final double? selectedRadius;
  final EdgeInsets? padding;
  final bool isSelected;
  const DotIndicator({super.key, required this.isSelected, this.selectedColor, this.unSelectedColor, this.unSelectedRadius, this.selectedRadius, this.padding});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(right: paddingXXXS),
      child: CircleAvatar(
        radius: isSelected ? (selectedRadius ?? 10.horizontalScale) : (unSelectedRadius ?? 5.horizontalScale),
        backgroundColor: isSelected ? (selectedColor ?? Theme.of(context).colorScheme.primary ): (unSelectedColor ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.3)),
      ),
    );
  }
}
