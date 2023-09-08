import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/constants/enum/type_enum.dart';
import '../../../../app/controllers/general/session_service.dart';
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
        await register();
        LoadingProgress.stop();
        Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.mainScreen.path, (route) => false,arguments: true);
      } catch (e) {
        LoadingProgress.stop();
        showErrorStateBottomSheet(message: e.toString());
      }
    }
  }

  Future<void> register() async {
    // final response = await General().signUp(
    //   signUpRequestModel: SignUpRequestModel(
    //     email: cEmail.text.toLowerCase(),
    //     password: cPassword.text,
    //     username: cUsername.text,
    //     zipCode: cZipcode.text,
    //     fcmToken: fcmToken ?? '1',
    //   ),
    // );
    // if (response.status == BaseModelStatus.Ok) {
    //   await sessionService.logIn(loggedInUser: response.data!.user!, token: response.data!.accessToken!);
    // } else {
    //   throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    // }
  }
}
