import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/num_extension.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_base_project/app/model/response/levels_response_model.dart';
import 'package:flutter_base_project/app/model/response/user_info_model.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets/assets.dart';
import '../../constants/other/padding_and_radius_size.dart';
import '../../theme/text_style/text_style.dart';
import 'image_avatar.dart';

class AchievementCard extends StatelessWidget {
  final Color? bgColor;
  final UserInfoModel userInfo;
  final LevelsResponseModel userLevel;

  const AchievementCard({super.key, this.bgColor, required this.userLevel,required this.userInfo});
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
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userInfo.email!,
                              style: s16W700Dark,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: paddingXXXXS),
                            Text(
                              'Level ${userLevel.level}',
                              style: s16W400Dark,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: paddingXXXS,
                  ),
                  Text(
                    userLevel.name!,
                    style: s31W700PrimaryPeachi,
                  ),
                  Text(
                    '${userInfo.savedCo2!.removeTrailingZeros()} CO2e Kg',
                    style: s16W700Dark,
                  ),
                ],
              ),
            ),
            Image.network(userLevel.imageUrl!,height: 100,width: 100,),
          ],
        ),
      ),
    );
  }
}
