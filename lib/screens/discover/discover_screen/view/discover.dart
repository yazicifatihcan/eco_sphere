import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/components/card/legal_information_card.dart';
import 'package:flutter_base_project/app/constants/assets/assets.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_base_project/app/libs/locale_manager/locale_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';
import '../controller/discover_controller.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverController>();
    return Scaffold(
      key: controller.scaffoldKey,
      floatingActionButton: GestureDetector(
        onTap: controller.onTapNextScreen,
        child: CircleAvatar(
              radius: 22.horizontalScale,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: SvgPicture.asset(arrowRightIcon),
            ),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: paddingXS),
          child: Text(
            'Discover',
            style: s31W700DarkPeachi,
          ),
        ),
      ),
      body: Obx(() => controller.loadingStatus != LoadingStatus.Loaded
          ? const SizedBox.shrink()
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingXS,vertical: paddingXL),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChange,
                    children: List.generate(controller.discovers.length, (index) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(paddingXL),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(greenLeafIcon,height: 120,width: 120,),
                            const SizedBox(height: paddingXS),
                            Text(controller.discovers[index].title!,style: s25W700DarkPeachi,textAlign: TextAlign.center,),
                            const SizedBox(height: paddingXS),
                            Text(controller.discovers[index].content!,style: s20W500Dark,textAlign: TextAlign.start,),
                          ],
                        ),
                      ),
                    )),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
