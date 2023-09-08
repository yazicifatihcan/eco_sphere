import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../../app/navigation/route/route_factory.dart';

class BottomNavigationBarItems {
  final Key? btnKey;
  final String icon;
  final bool isSelected;

  const BottomNavigationBarItems(
    this.btnKey, {
    required this.icon,
    required this.isSelected,
  });

  BottomNavigationBarItem bottomNavigationBarItemWidget() {
    return BottomNavigationBarItem(
      label: '',
      icon: CircleAvatar(
        backgroundColor: isSelected ? Theme.of(MyRouteFactory.context).colorScheme.primary : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(paddingXXXS),
          child: SvgPicture.asset(
            icon,
            key: btnKey,
            height: 24.horizontalScale,
            width: 24.horizontalScale,
            colorFilter: ColorFilter.mode(
                isSelected ? Theme.of(MyRouteFactory.context).colorScheme.surface : Colors.black, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
