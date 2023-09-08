import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/components/card/achievement_card.dart';
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
            'Community',
            style: s31W700DarkPeachi,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingXS),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: paddingXL),
              Text(
                'My Stats',
                style: s25W700DarkPeachi,
              ),
              const SizedBox(height: paddingXS),
              AchievementCard(
                bgColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
              const SizedBox(height: paddingXL),
              Text(
                'Community',
                style: s25W700DarkPeachi,
              ),
              const SizedBox(height: paddingXS),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const AchievementCard(),
                  separatorBuilder: (context, index) => const SizedBox(height: paddingXXXS),
                  itemCount: 8,
                ),
              ),
              const SizedBox(height: paddingXL),
            ],
          ),
        ),
      ),
    );
  }
}
