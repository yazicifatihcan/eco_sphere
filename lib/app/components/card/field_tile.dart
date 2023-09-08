import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/other/padding_and_radius_size.dart';
import '../../theme/text_style/text_style.dart';


class FieldTile extends StatelessWidget {
  final Color? color;
  final String? text;
  final TextStyle? style;
  final String iconPath;
  final VoidCallback? onTap;
  final Widget? child;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? paddingBeetwen;
  const FieldTile({
    Key? key,
    this.color,
    this.text,
    this.onTap,
    required this.iconPath,
    this.style,
    this.crossAxisAlignment,
    this.child,
    this.paddingBeetwen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 24.horizontalScale,
            width: 24.horizontalScale,
            colorFilter: ColorFilter.mode(color ?? Theme.of(context).colorScheme.onSurface, BlendMode.srcIn),
          ),
          SizedBox(
            width: paddingBeetwen ?? paddingXS,
          ),
          Expanded(
              child: child ??
                  Text(
                    text!,
                    style: style ?? s20W500Dark.copyWith(color: color),
                  )),
        ],
      ),
    );
  }
}
