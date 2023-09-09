import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/components/other/progress_widget.dart';
import 'package:flutter_base_project/app/constants/assets/assets.dart';
import 'package:flutter_base_project/app/constants/enum/loading_status_enum.dart';
import 'package:flutter_base_project/app/extensions/num_extension.dart';
import 'package:flutter_base_project/app/extensions/widget_extension.dart';
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
                child: Text('Hi ', style: s31W700DarkPeachi),
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
                            Image.network(controller.getUsersCurrentLevel().imageUrl!),
                            const SizedBox(
                              height: paddingM,
                            ),
                            Text(
                              'Level ${controller.getUsersCurrentLevel().level}',
                              style: s20W700DarkPeachi,
                            ),
                            const SizedBox(
                              height: paddingXXXS,
                            ),
                            Text(controller.getUsersCurrentLevel().name!, style: s20W700DarkPeachi),
                            const SizedBox(
                              height: paddingXS,
                            ),
                            Column(
                              children: [
                                ProgressWidget(
                                    total: controller.getUsersNextLevel().co2Amount!.toDouble(),
                                    current: controller.currentUser.savedCo2!),
                                const SizedBox(
                                  height: paddingXXXS,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.currentUser.savedCo2!.removeTrailingZeros(),
                                      style: s16W400Dark,
                                    ),
                                    Text(
                                      controller.getUsersNextLevel().co2Amount!.toDouble().removeTrailingZeros(),
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
                              onTap: controller.onTapTakeAction,
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
                          return  GestureDetector(
                            onTap: ()=>controller.onTapAddActivity(item),
                            child: Stack(
                              children: [
                                Card(
                                  color: controller.calculateRemainings(item) <= 0
                                      ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                                      : null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(paddingXL),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(item.category!.name!,style: s20W700DarkPeachi,),
                                              const SizedBox(height: paddingXXXS,),
                                              Text(item.name!,style: s16W400Dark,)
                                            ],
                                          ),
                                        ),
                                        Image.network(item.imageUrl!,height: 40,width: 40,),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left: paddingXXS,
                                    top: paddingXXS,
                                    child: const CircleAvatar(radius: 10,child: Icon(Icons.done,size: 12,)).isVisible(controller.calculateRemainings(item) <= 0)),
                              ],
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
