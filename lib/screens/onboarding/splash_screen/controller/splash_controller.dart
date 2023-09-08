import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/app/extensions/context_extension.dart';
import 'package:flutter_base_project/app/navigation/route/route_factory.dart';
import 'package:get/get.dart';
import '../../../../app/constants/enum/cache_key_enum.dart';
import '../../../../app/controllers/general/session_service.dart';
import '../../../../app/libs/locale_manager/locale_manager.dart';
import '../../../../app/mixin/state_bottom_sheet_mixin.dart';
import '../../../../app/navigation/route/route.dart';
import '../../../../core/exception/app_exception.dart';
import '../../../../core/i10n/i10n.dart';
import '../../../navigation/bottom_navigation/bottom_navigation_bar_item/controller/bottom_navigation_bar_controller.dart';

class SplashController extends GetxController with StateBottomSheetMixin {
  final GlobalKey scaffoldKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  Future<void> _init() async {
    final context = scaffoldKey.currentContext!;
    final future = Future.delayed(const Duration(seconds: 2));
    final sessionService = Get.put(SessionService());
    Get.put(BottomNavigationBarController());

    // /// version kontrol
    // try {
    //   final forceUpdate = false;
    //   final version = await _getRemoteVersion();

    //   // ignore: dead_code
    //   if (forceUpdate && await forceUpdateControl(version)) return;
    // } catch (e) {}

    try {
      await checkInternet();

      

      if (sessionService.isUserLogin()) {
        await _getUser(sessionService);
      }

      future.whenComplete(() async{
        bool isFirstLogin = LocaleManager.instance.getBoolValue(CacheKey.isFirstLogin) ?? true;
        if (isFirstLogin){
            Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.onboardingScreen.path, (route) => false);
        }
        else {
          if (sessionService.isUserLogin()) {
            Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.mainScreen.path, (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.loginScreen.path, (route) => false);
          }
        }
      });
    } on UserLoginException catch (_){
      sessionService.logOut();
      Navigator.pushNamed(context, MainScreensEnum.loginScreen.path);
    }catch (e) {
      showErrorStateBottomSheet(
          message: e.toString(),
          onTapFirstBtn: () {
            Navigator.pop(context);
            onReady();
          });
    }
  }

  Future<void> _getUser(SessionService sessionService) async {
    // final response = await General().getCurrentUser();
    // if (response.status == BaseModelStatus.Ok) {
    //   await sessionService.logIn(loggedInUser: response.data!, token: sessionService.getUserToken()!);
    // } else {
    //   throw UserLoginException();
    // }
  }

  // Future<String> _getRemoteVersion() async {
  //   return '1.0.0';
  // }

  /// Internet control
  Future<void> checkInternet() async {
    final context = scaffoldKey.currentContext!;
    if (!await context.checkInternet(MyRouteFactory.context)) {
      throw AppException(AppLocalization.getLabels.noInternetErrorMessage);
    }
  }
}


class UserLoginException implements Exception {
  UserLoginException() : super();
}
