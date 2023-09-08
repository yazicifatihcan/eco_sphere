import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';
import 'package:get/get.dart';
import '../../../../app/theme/color/app_colors.dart';
import 'controller/bottom_navigation_bar_controller.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;
  const AppBottomNavigationBar({Key? key, required this.onTap}) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        return;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarCont = Get.find<BottomNavigationBarController>();
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColor.grey.withOpacity(0.4),
              blurRadius: 5,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          enableFeedback: true,
          selectedFontSize: 12.horizontalScale,
          unselectedFontSize: 12.horizontalScale,
          backgroundColor: Theme.of(context).colorScheme.surface,
          //Index
          currentIndex: bottomNavigationBarCont.selectedIndex,
          onTap: (int value) => widget.onTap.call(value),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          ///Item
          unselectedItemColor: AppColor.background,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          items: bottomNavigationBarCont.bottomNavigationBarItems(context),
        ),
      ),
    );
  }
}
