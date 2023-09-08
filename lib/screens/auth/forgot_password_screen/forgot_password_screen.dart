import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/forgot_password_controller.dart';
import 'view/forgot_password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ForgotPasswordController(),
      builder: (_) => const ForgotPassword(),
    );
  }
}