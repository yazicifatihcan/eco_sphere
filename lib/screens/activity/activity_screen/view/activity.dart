import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/num_extension.dart';
import 'package:get/get.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';
import '../controller/activity_controller.dart';

class Activity extends StatelessWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ActivityController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
            padding: const EdgeInsets.only(left: paddingXS), child: Text('Take Action !', style: s31W700DarkPeachi)),
      ),
      body: Obx(() => controller.loadingStatus != LoadingStatus.Loaded
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingXS),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: paddingXL),
                    Flexible(
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.allActivities.length,
                        itemBuilder: (context, index) {
                          final item = controller.allActivities[index];
                          return GestureDetector(
                            onTap: ()=>controller.onTapAddActivity(item),
                            child: Stack(
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(radiusM),
                                    border: Border.all(color: Theme.of(context).colorScheme.primary),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: paddingXL, horizontal: paddingXXXS),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Flexible(child: Image.network(item.imageUrl!)),
                                        const SizedBox(
                                          height: paddingXXXS,
                                        ),
                                        Text(item.category!.name!, style: s16W700Dark, textAlign: TextAlign.center),
                                        const SizedBox(
                                          height: paddingXXXS,
                                        ),
                                        Text(
                                          item.name!,
                                          style: s16W400Dark,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: paddingXXXS,
                                        ),
                                        Text(
                                          '${item.amount!.removeTrailingZeros()} Kg CO2',
                                          style: s16W700Primary,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: paddingXXXS,
                                  top: paddingXXXS,
                                  child: CircleAvatar(
                                    child: Text(controller.calculateRemainings(item).toString()),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1,
                          crossAxisCount: 2,
                          crossAxisSpacing: paddingXS,
                          mainAxisSpacing: paddingXS,
                        ),
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
