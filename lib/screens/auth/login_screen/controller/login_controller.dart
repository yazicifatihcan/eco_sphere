import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/controllers/general/session_service.dart';
import '../../../../app/mixin/state_bottom_sheet_mixin.dart';
import '../../../../app/navigation/route/route.dart';
import '../../../navigation/bottom_navigation/bottom_navigation_bar_item/controller/bottom_navigation_bar_controller.dart';

class LoginController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final SessionService sessionService = Get.find();

  BuildContext get context => scaffoldKey.currentContext!;

  final GlobalKey<FormState> fLogin = GlobalKey<FormState>();
  final TextEditingController cEmail = TextEditingController();
  final TextEditingController cPassword = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    cEmail.dispose();
    cPassword.dispose();
  }

  void unfocus() => FocusScope.of(context).unfocus();


  void onTapLogin() async {
    if (fLogin.currentState!.validate()) {
      try {
        LoadingProgress.start();
        await signIn();
        LoadingProgress.stop();
        Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.mainScreen.path, (route) => false);
        Get.find<BottomNavigationBarController>().selectedIndex=0;
      } catch (e) {
        LoadingProgress.stop();
        showErrorStateBottomSheet(message: e.toString());
      }
    }
  }

  Future<void> signIn() async {
    // final SignInRequestModel signInRequestModel = SignInRequestModel(email: cEmail.text.toLowerCase(), password: cPassword.text,fcmToken: fcmToken ?? '1');
    // final response = await General().signIn(signInRequestModel: signInRequestModel);
    // if (response.status == BaseModelStatus.Ok) {
    //   await sessionService.logIn(loggedInUser: response.data!.user!, token: response.data!.accessToken!);
    // } else {
    //   throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    // }
  }

  void onTapForgotPassword() => Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.forgotPasswordScreen.path, (route) => false);

  void onTapIDontHaveAnAccount() => Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.registerScreen.path, (route) => false);
}
