import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/constants/assets/assets.dart';
import '../view/bottom_navigation_bar_item.dart';

class BottomNavigationBarController extends GetxController {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final RxInt _selectedIndex = 0.obs;

  ///BottomNavigationBar için kullanılan index
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) {
    if (_selectedIndex.value != value) _selectedIndex.value = value;
  }

  List<BottomNavigationBarItem> bottomNavigationBarItems(BuildContext context) {
    return [
      BottomNavigationBarItems(
        const Key('bottomHomeKey'),
        isSelected: selectedIndex == 0 ? true : false,
        icon: bottomBarHomeIcon,
      ).bottomNavigationBarItemWidget(),
      BottomNavigationBarItems(
        const Key('bottomExploreCamps'),
        icon: bottomBarExploreCampsIcon,
        isSelected: selectedIndex == 1 ? true : false,
      ).bottomNavigationBarItemWidget(),
      BottomNavigationBarItems(
        const Key('bottomFriendCircles'),
        isSelected: selectedIndex == 2 ? true : false,
        icon: bottomBarFriendCirclesIcon,
      ).bottomNavigationBarItemWidget(),
      BottomNavigationBarItems(
        const Key('bottomAccount'),
        icon: bottomBarFriendsIcon,
        isSelected: selectedIndex == 3 ? true : false,
      ).bottomNavigationBarItemWidget(),
      BottomNavigationBarItems(
        const Key('bottomAccount'),
        icon: bottomBarAccountIcon,
        isSelected: selectedIndex == 4 ? true : false,
      ).bottomNavigationBarItemWidget(),
    ];
  }
}
