import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/discover_controller.dart';
import 'view/discover.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DiscoverController(),
      builder: (_) => const Discover(),
    );
  }
}