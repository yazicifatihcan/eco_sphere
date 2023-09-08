import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/register_controller.dart';
import 'view/register.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegisterController(),
      builder: (_) => const Register(),
    );
  }
}