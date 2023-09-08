import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/constants/enum/type_enum.dart';
import 'controller/legal_controller.dart';
import 'view/legal.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LegalController(legalType: ModalRoute.of(context)!.settings.arguments as LegalTypesEnum),
      builder: (_) => const Legal(),
    );
  }
}