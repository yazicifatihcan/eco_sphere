import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/model/response/user_info_model.dart';
import 'package:get/get.dart';
import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/constants/enum/type_enum.dart';
import '../../../../app/controllers/general/session_service.dart';
import '../../../../app/libs/firebase/firebae_auth_manager.dart';
import '../../../../app/mixin/state_bottom_sheet_mixin.dart';
import '../../../../app/navigation/route/route.dart';

class RegisterController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final SessionService sessionService = Get.find();

  BuildContext get context => scaffoldKey.currentContext!;

  final GlobalKey<FormState> fRegister = GlobalKey<FormState>();
  final TextEditingController cUsername = TextEditingController();
  final TextEditingController cEmail = TextEditingController();
  final TextEditingController cZipcode = TextEditingController();
  final TextEditingController cPassword = TextEditingController();
  final TextEditingController cPasswordRepeat = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    cUsername.dispose();
    cEmail.dispose();
    cZipcode.dispose();
    cPassword.dispose();
    cPasswordRepeat.dispose();
  }

  void unfocus() => FocusScope.of(context).unfocus();

  void onTapTandC() => Navigator.pushNamed(context, MainScreensEnum.legalScreen.path,arguments: LegalTypesEnum.TERMS);

  void onTapPrivacyPolicy() => Navigator.pushNamed(context, MainScreensEnum.legalScreen.path,arguments: LegalTypesEnum.PRIVACY);

  void onTapIHaveAnAccount() => Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.loginScreen.path, (route) => false);

  void onTapRegister() async {
    if (fRegister.currentState!.validate()) {
      try {
        LoadingProgress.start();
        final user = await register();
        await sessionService.logIn(user);
        LoadingProgress.stop();
        Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.mainScreen.path, (route) => false,arguments: true);
      } catch (e) {
        LoadingProgress.stop();
        showErrorStateBottomSheet(message: e.toString());
      }
    }
  }

  Future<UserInfoModel> register() async {
   try {
      final userCredentials = await FirebaseAuthManager().signUpWithEmailAndPassword(
        cEmail.text,
        cPassword.text
      );
      final user = await FirebaseAuthManager().generateUserInfoModelFromCredential(userCredentials,SignUpWaysEnum.EMAIL);
      await FirebaseAuthManager().saveUserToFirebase(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
