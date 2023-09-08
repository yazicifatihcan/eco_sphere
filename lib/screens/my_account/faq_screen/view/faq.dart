import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../app/components/app_bar/app_bar_with_arrow_back.dart';
import '../../../../app/constants/assets/assets.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';
import '../controller/faq_controller.dart';

part 'components/faq_card.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FaqController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: const AppBarWithArrowBack(title: 'Frequently asked questions'),
      body: Obx(() => controller.loadingStatus != LoadingStatus.Loaded
          ? const SizedBox.shrink()
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXL),
              itemBuilder: (context, index) => Obx(() => _FAQCard(
                    isOpen: controller.faqOpenedIndex == index,
                    title: controller.faqs[index].question!,
                    content: controller.faqs[index].answer!,
                    onTap: () => controller.onTapFaqCard(index),
                  )),
              separatorBuilder: (context, index) => const SizedBox(height: paddingXXXS),
              itemCount: controller.faqs.length,
            )),
    );
  }
}
