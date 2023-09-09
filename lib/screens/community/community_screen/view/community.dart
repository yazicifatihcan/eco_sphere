import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/components/card/achievement_card.dart';
import 'package:flutter_base_project/app/constants/enum/loading_status_enum.dart';
import 'package:flutter_base_project/app/controllers/general/session_service.dart';
import 'package:get/get.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';
import '../controller/community_controller.dart';

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CommunityController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: paddingXS),
          child: Text(
            'Leaderboard',
            style: s31W700DarkPeachi,
          ),
        ),
      ),
      body: Obx(()=>
      controller.loadingStatus!=LoadingStatus.Loaded ? const SizedBox.shrink() :
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingXS),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: paddingXL),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => AchievementCard(
                    userInfo:controller.allUsers[index],
                    userLevel: controller.getUsersCurrentLevel(controller.allUsers[index]),
                    bgColor: controller.allUsers[index].uuid==Get.find<SessionService>().currentUser.uuid ? Theme.of(context).colorScheme.primary.withOpacity(0.3) : null,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(height: paddingXXXS),
                  itemCount: controller.allUsers.length,
                ),
              ),
              const SizedBox(height: paddingXL),
            ],
          ),
        ),
      )),
    );
  }
}
