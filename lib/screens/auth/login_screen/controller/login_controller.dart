import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/libs/firebase/firebae_auth_manager.dart';
import 'package:flutter_base_project/app/model/response/user_info_model.dart';
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
        final user = await signIn();
        await sessionService.logIn(user);
        LoadingProgress.stop();
        Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.mainScreen.path, (route) => false);
        Get.find<BottomNavigationBarController>().selectedIndex = 0;
      } catch (e) {
        LoadingProgress.stop();
        showErrorStateBottomSheet(message: e.toString());
      }
    }
  }

  Future<UserInfoModel> signIn() async {
    try {
      final user = await FirebaseAuthManager().loginWithEmailAndPassword(cEmail.text, cPassword.text);
      return await FirebaseAuthManager().getUserInfoFromFirebase(user.user!.uid);
    } catch (e) {
      rethrow;
    }
  }

  void onTapLoginWithGoogle() async {
    try{
      LoadingProgress.start();
      await FirebaseAuthManager().loginWithGoogle();
      LoadingProgress.stop();
    }catch(e){
      LoadingProgress.stop();
      showErrorStateBottomSheet(message: e.toString());
    }
  }

  void onTapForgotPassword() =>
      Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.forgotPasswordScreen.path, (route) => false);

  void onTapIDontHaveAnAccount() =>
      Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.registerScreen.path, (route) => false);
}
