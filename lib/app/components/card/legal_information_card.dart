import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widget_extension.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets/assets.dart';
import '../../constants/other/padding_and_radius_size.dart';
import '../../theme/text_style/text_style.dart';

class LegalInformationCard extends StatelessWidget {
  final String title;
  final String? content;
  final String? iconPath;
  final bool isIconVisible;
  final TextStyle? titleTextStyle;
  final TextStyle? contentTextStyle;
  final EdgeInsets? contentPadding;
  final Widget? contentWidget;

  const LegalInformationCard({super.key, required this.title, this.content, this.iconPath, this.isIconVisible = true, this.titleTextStyle, this.contentTextStyle, this.contentPadding, this.contentWidget});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(paddingXS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: paddingXS),
                  child: SvgPicture.asset(iconPath ?? privacyPolicyIcon,height: 24.horizontalScale,width: 24.horizontalScale,),
                ).isVisible(isIconVisible),
                Text(
                  title,
                  style: titleTextStyle?.copyWith(height: 1.4) ?? s20W800Dark,
                )
              ],
            ),
            const SizedBox(height: paddingXS),
            contentWidget ?? Padding(
              padding: contentPadding ??  EdgeInsets.zero,
              child: Text(
                content!,
                style: contentTextStyle?.copyWith(height: 1.4) ?? s16W400Dark.copyWith(height: 1.4),
              ),
            )
          ],
        ),
      ),
    );
  }
}
