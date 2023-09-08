import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import '../../constants/assets/assets.dart';
import '../../constants/other/icon_with_circle_bg.dart';
import '../../constants/other/padding_and_radius_size.dart';
import '../../libs/app/size_config.dart';
import '../../theme/text_style/text_style.dart';

class AppBarWithArrowBack extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onTapBack;
  const AppBarWithArrowBack({
    Key? key,
    required this.title,
    this.onTapBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 44.horizontalScale + (paddingXS * 2),
      leading: IconWithCircleBg(
        iconPath: arrowBackIcon,
        onTap: onTapBack,
      ),
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: s20W700Dark,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.appBarHeight);
}
