import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/controllers/general/session_service.dart';
import '../../../../../app/navigation/route/route.dart';

class MainController extends GetxController {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final SessionService sessionService = Get.find<SessionService>();


  Future<bool> onWillScope() async {
    String? currentPath;

    navigatorKey.currentState?.popUntil((route) {
      currentPath = route.settings.name;
      return true;
    });


    if (currentPath != MainScreensEnum.mainScreen.path) {
      navigatorKey.currentState!.maybePop();

      return false;
    } else {
      return true;
    }
  }
}
