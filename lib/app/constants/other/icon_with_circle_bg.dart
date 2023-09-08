import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/constants/other/padding_and_radius_size.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/assets.dart';

class IconWithCircleBg extends StatelessWidget {
  final VoidCallback? onTap;
  final String? iconPath;
  final EdgeInsets? padding;
  final double? radius;
  final IconData? iconData;
  const IconWithCircleBg({
    super.key,
    this.onTap,
    this.iconPath, this.padding, this.radius, this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: paddingXS),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          radius: radius ?? 22.horizontalScale,
          child: iconData!=null ? Icon(iconData) : SvgPicture.asset(iconPath ?? closeIcon),
        ),
      ),
    );
  }
}
