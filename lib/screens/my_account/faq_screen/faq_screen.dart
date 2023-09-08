import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/faq_controller.dart';
import 'view/faq.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: FaqController(),
      builder: (_) => const Faq(),
    );
  }
}