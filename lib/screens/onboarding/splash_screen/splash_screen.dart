import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/splash_controller.dart';
import 'view/splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (_) => const Splash(),
    );
  }
}
