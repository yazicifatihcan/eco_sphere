import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/navigation/route/route.dart';
import '../bottom_navigation_bar_item/bottom_navigation_bar.dart';
import '../bottom_navigation_bar_item/controller/bottom_navigation_bar_controller.dart';
import 'controller/main_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      autoRemove: false,
      builder: (controller) => WillPopScope(
        onWillPop: controller.onWillScope,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: GetX<BottomNavigationBarController>(builder: (bottomNavigationBarController) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              body: PageTransitionSwitcher(
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: bottomNavigationBarScreens[bottomNavigationBarController.selectedIndex],
              ),
              bottomNavigationBar: AppBottomNavigationBar(
                onTap: (int value) => setState(() => bottomNavigationBarController.selectedIndex = value),
              ),
            );
          }),
        ),
      ),
    );
  }
}
