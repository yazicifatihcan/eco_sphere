import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets/assets.dart';
import '../../constants/other/padding_and_radius_size.dart';

class AddActivityAvatar extends StatelessWidget {
  final VoidCallback onTap;
  final double? radius;
  final String? text;
  final Color? bgColor;
  final String? iconPath;
  const AddActivityAvatar({
    Key? key,
    required this.onTap,
    this.radius,
    this.text,
    this.bgColor,
    this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius ?? 52.horizontalScale,
        backgroundColor: bgColor ?? Theme.of(context).colorScheme.primary.withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath ?? addIcon),
            const SizedBox(
              height: paddingXXXS,
            ),
            Text(
              text ?? 'Add pic',
              style: s10W800Primary,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
