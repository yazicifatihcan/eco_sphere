import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/components/other/progress_widget.dart';
import 'package:flutter_base_project/app/constants/assets/assets.dart';
import 'package:flutter_base_project/app/constants/enum/loading_status_enum.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../app/components/card/take_action_card.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';
import '../controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: paddingXS),
          child: Row(
            children: [
              Flexible(
                child: Text('Hi Marek ', style: s31W700DarkPeachi),
              ),
              Text('👋🏽', style: s31W700DarkPeachi),
              const SizedBox(
                width: paddingXS,
              )
            ],
          ),
        ),
      ),
      body: Obx(() => controller.loadingStatus != LoadingStatus.Loaded
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingXS),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: paddingXL),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(paddingXL),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              greenLeafIcon,
                              height: 200,
                              width: 200,
                            ),
                            const SizedBox(
                              height: paddingM,
                            ),
                            Text(
                              'Level 1',
                              style: s20W700DarkPeachi,
                            ),
                            const SizedBox(
                              height: paddingXXXS,
                            ),
                            Text('The Seed', style: s20W700DarkPeachi),
                            const SizedBox(
                              height: paddingXS,
                            ),
                            Column(
                              children: [
                                const ProgressWidget(total: 40000, current: 8000),
                                const SizedBox(
                                  height: paddingXXXS,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '8000',
                                      style: s16W400Dark,
                                    ),
                                    Text(
                                      '40000',
                                      style: s16W400Dark,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: paddingXS,
                            ),
                            InviteFriendCard(
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: paddingXL),
                    Text(
                      'Daily Tasks',
                      style: s25W700DarkPeachi,
                    ),
                    const SizedBox(height: paddingXS),
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = controller.dailyTasks[index];
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(paddingXL),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.title!,style: s16W700Dark,),
                                  const SizedBox(height: paddingXS,),
                                  Text(item.content!,style: s16W400Dark,),
                                  const SizedBox(height: paddingXS,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(greenLeafIcon,height: 24,width: 24,),
                                      const SizedBox(width: paddingXXXS,),
                                      Text(item.savedCo2!,style: s16W700Primary,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: paddingXXXS),
                        itemCount: controller.dailyTasks.length,
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
