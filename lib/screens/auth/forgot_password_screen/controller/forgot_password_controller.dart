import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/components/message/toast_message.dart';
import '../../../../app/mixin/state_bottom_sheet_mixin.dart';
import '../../../../app/navigation/route/route.dart';

class ForgotPasswordController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  String otpText = '';

  final GlobalKey<FormState> fForgotPassword = GlobalKey<FormState>();
  final TextEditingController cEmail = TextEditingController();
  final TextEditingController cNewPassword = TextEditingController();

  final Rx<int> _currentStep = 1.obs;

  int get currentStep => _currentStep.value;
  set currentStep(int value) => _currentStep.value = value;

  late String transactionId;

  @override
  void onClose() {
    super.onClose();
    cEmail.dispose();
    cNewPassword.dispose();
  }

  void unfocus() => FocusScope.of(context).unfocus();

  ///FIRST FORM FUNCTIONS
  Future<void> onTapSendMeAnOtp() async {
    if (fForgotPassword.currentState!.validate()) {
      try {
        LoadingProgress.start();
        await resetPassword();
        LoadingProgress.stop();
        currentStep++;
      } catch (e) {
        LoadingProgress.start();
        showErrorStateBottomSheet(message: e.toString(), onTapFirstBtn: onTapTryAgain);
      }
    }
  }

  Future<void> resetPassword() async {
    // final ResetPasswordRequestModel resetPasswordRequestModel = ResetPasswordRequestModel(email: cEmail.text.toLowerCase());
    // final response = await General().resetPassword(resetPasswordRequestModel: resetPasswordRequestModel);
    // if (response.status != BaseModelStatus.Ok) {
    //   throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    // }
  }

  ///SECOND FORM FUNCTIONS
  void onChangeOtpInput(String value) async {
    otpText = value;
    if (value.length == 6) {
      try {
        LoadingProgress.start();
        await verifyOtp();
        LoadingProgress.stop();
        currentStep++;
      } catch (e) {
        LoadingProgress.stop();
        showErrorStateBottomSheet(message: e.toString(), onTapFirstBtn: onTapTryAgain);
      }
    }
  }

  void onTapVerify() async {
    if (otpText.length == 6) {
      try {
        LoadingProgress.start();
        await verifyOtp();
        LoadingProgress.stop();
        currentStep++;
      } catch (e) {
        LoadingProgress.stop();
        showErrorStateBottomSheet(message: e.toString(), onTapFirstBtn: onTapTryAgain);
      }
    } else {
      showWarningToastMessage('Please enter 4 digit otp code.');
    }
  }

  Future<void> verifyOtp() async {
    // final VerifyOtpRequestModel verifyOtpRequestModel = VerifyOtpRequestModel(otpCode: otpText, email: cEmail.text.toLowerCase());
    // final response = await General().verifyOtp(verifyOtpRequestModel: verifyOtpRequestModel);
    // if (response.status == BaseModelStatus.Ok) {
    //   transactionId = response.data!.transactionId!;
    // } else {
    //   throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    // }
  }

  ///THIRD FORM FUNCTIONS
  void onTapCreateNewPassword() async {
    if (fForgotPassword.currentState!.validate()) {
      try {
        LoadingProgress.start();
        await updatePassword();
        LoadingProgress.stop();
        showWarningToastMessage('New password succesfully created!');
        Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.loginScreen.path, (route) => false);
      } catch (e) {
        LoadingProgress.stop();
        showErrorStateBottomSheet(message: e.toString(), onTapFirstBtn: onTapTryAgain);
      }
    }
  }

  Future<void> updatePassword() async {
    // final UpdatePasswordRequestModel updatePasswordRequestModel = UpdatePasswordRequestModel(email: cEmail.text.toLowerCase(), password: cNewPassword.text, transactionId: transactionId);
    // final response = await General().updatePassword(updatePasswordRequestModel: updatePasswordRequestModel);
    // if (response.status != BaseModelStatus.Ok) {
    //   throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    // }
  }

  void onTapTryAgain() {
    Navigator.pop(context);
    currentStep = 1;
  }

  void onTapBack() => Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.loginScreen.path, (route) => false);
}
