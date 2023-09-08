part of '../onboarding.dart';

class _OnboardingView extends StatelessWidget {
  final OnboardingController controller;
  _OnboardingView({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Expanded(
          child: SvgPicture.asset(
                controller.titles[controller.currentScreenIndex].svgPath,
              ),
        )),
        Obx(() => Expanded(
          child: Align(
                alignment: Alignment.bottomCenter,
                child: _OnboardingInfoCard(
                  title: controller.titles[controller.currentScreenIndex].title,
                  subtitle: controller.titles[controller.currentScreenIndex].subtitle,
                ),
              ),
        )),
      ],
    );
  }
}
