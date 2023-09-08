import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/community_controller.dart';
import 'view/community.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CommunityController(),
      builder: (_) => const Community(),
    );
  }
}