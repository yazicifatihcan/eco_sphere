import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/activity_controller.dart';
import 'view/activity.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ActivityController(),
      builder: (_) => const Activity(),
    );
  }
}