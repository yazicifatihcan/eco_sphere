import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/constants/app/app_constant.dart';
import '../../../../app/constants/assets/assets.dart';
import '../../../../app/constants/enum/cache_key_enum.dart';
import '../../../../app/libs/locale_manager/locale_manager.dart';
import '../../../../app/navigation/route/route.dart';
import '../model/onboarding_screen_model.dart';

class OnboardingController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  final Rx<int> _currentScreenIndex = 0.obs;

  int get currentScreenIndex => _currentScreenIndex.value;
  set currentScreenIndex(int value) => _currentScreenIndex.value = value;

  final pageController = PageController();

final List<OnboardingScreenModel> titles = [
    OnboardingScreenModel(
        title: 'Welcome to Green App',
        subtitle: 'An IoT app developed with Helium to calculate your carbon footprint and track daily activities.',
        svgPath: onboardingFirstImage),
    OnboardingScreenModel(
        title: 'Calculate Carbon Footprint',
        subtitle: 'Measure your environmental impact and make eco-friendly choices.',
        svgPath: onboardingSecondImage),
    OnboardingScreenModel(
        title: 'IoT Data Collection',
        subtitle: 'Get real-time data from smart devices to reduce your carbon footprint.',
        svgPath: onboardingThirdImage),
    OnboardingScreenModel(
        title: 'Eco-Friendly Choices',
        subtitle: 'Log activities like shorter showers, plant-based meals, and reusable products.',
        svgPath: onboardingFourthImage),
];

  @override
  void onReady() {
    super.onReady();
    LocaleManager.instance.setBoolValue(CacheKey.isFirstLogin, false);
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  void onPageChange(int index) => currentScreenIndex = index;

  void onTapNextScreen() async {
    if (currentScreenIndex == 3) {
      Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.registerScreen.path, (route) => false);
    } else {
      pageController.nextPage(
        duration: animationDurationMS,
        curve: Curves.ease,
      );
    }
  }

  void onTapSkip() async {
    Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.loginScreen.path, (route) => false);
  }
}
