import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/my_account_controller.dart';
import 'view/my_account.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MyAccountController(),
      builder: (_) => const MyAccount(),
    );
  }
}