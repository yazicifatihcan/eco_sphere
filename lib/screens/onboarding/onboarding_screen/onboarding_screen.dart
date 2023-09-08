import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/onboarding_controller.dart';
import 'view/onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OnboardingController(),
      builder: (_) => const Onboarding(),
    );
  }
}