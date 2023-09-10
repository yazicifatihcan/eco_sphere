import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/constants/other/padding_and_radius_size.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../app/constants/assets/assets.dart';
import '../controller/splash_controller.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      key: controller.scaffoldKey,
      body: Card(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(greenLeafIcon,height: 100,width: 100,),
            const SizedBox(height: paddingM,),
            const Center(child: CircularProgressIndicator(),),
          ],
        ),
      ),
    );
  }
}
