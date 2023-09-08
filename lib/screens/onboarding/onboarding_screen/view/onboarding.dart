import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../app/components/button/clckable_text.dart';
import '../../../../app/components/card/bottom_sheet_typed_card.dart';
import '../../../../app/components/other/dot_indicator.dart';
import '../../../../app/constants/assets/assets.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';
import '../controller/onboarding_controller.dart';

part 'components/next_page_button_with_circular_indicator.dart';
part 'components/bottom_card.dart';
part 'components/bottom_navigation_buttons.dart';
part 'components/onboarding_view.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Scaffold(
      appBar: AppBar(),
      key: controller.scaffoldKey,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChange,
            children: [
              _OnboardingView(controller: controller),
              _OnboardingView(controller: controller),
              _OnboardingView(controller: controller),
              _OnboardingView(controller: controller),
            ],
          ),
          Positioned(
            right: paddingXS,
            top: 0,
            child: ClickableText(
              onTap: controller.onTapSkip,
              text: 'Skip',
              padding: const EdgeInsets.only(right: paddingXS),
            ),
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingM).copyWith(top: 0),
                child: _BottomNavigationButtons(onTapNext: controller.onTapNextScreen, currentPage: controller.currentScreenIndex),
              ))
        ],
      ),
    );
  }
}
