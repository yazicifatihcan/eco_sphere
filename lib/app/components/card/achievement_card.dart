import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets/assets.dart';
import '../../constants/other/padding_and_radius_size.dart';
import '../../theme/text_style/text_style.dart';
import 'image_avatar.dart';

class AchievementCard extends StatelessWidget {
  final Color? bgColor;

  const AchievementCard({super.key, this.bgColor});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(paddingXS),
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ImageAvatar(
                        showNoAvatar: true,
                        radius: 30.horizontalScale,
                      ),
                      const SizedBox(
                        width: paddingXS,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '@Marek',
                            style: s16W700Dark,
                          ),
                          const SizedBox(height: paddingXXXXS),
                          Text(
                            'Level 1',
                            style: s16W400Dark,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: paddingXS,
                  ),
                  Text(
                    'The Seed',
                    style: s31W700PrimaryPeachi,
                  ),
                  Text(
                    '5.79 CO2e tons',
                    style: s16W700Dark,
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              greenLeafIcon,
              height: 120,
              width: 120,
            )
          ],
        ),
      ),
    );
  }
}
