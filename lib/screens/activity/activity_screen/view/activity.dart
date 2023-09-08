import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/activity_controller.dart';
  
class Activity extends StatelessWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ActivityController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(),
      body: Container(),
    );
  }
}