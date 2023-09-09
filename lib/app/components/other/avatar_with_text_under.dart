import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widget_extension.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';

import '../../constants/other/padding_and_radius_size.dart';
import '../card/image_avatar.dart';

class AvatarWithTextUnder extends StatelessWidget {
  final String? url;
  final String? mainText;
  final String? subText;
  final String? avatarPath;
  final Color? outerAvatarColor;
  final VoidCallback? onTap;
  final TextStyle? mainTextStyle;
  final TextStyle? subTextStyle;
  final double? avatarRadius;
  final Widget? avatarChild;
  final double? titleGap;
  final double? subTextGap;
  final double? maxHeight;
  final double? maxWidth;
  final double? outerAvatarRadius;
  final bool showNoAvatar;
  final bool showSubText;
  final bool showMainText;
  const AvatarWithTextUnder({
    super.key, this.url, this.mainText, this.subText, this.mainTextStyle, this.subTextStyle, this.avatarRadius, this.onTap, this.avatarChild, this.titleGap, this.subTextGap, this.outerAvatarColor, this.showNoAvatar=false, this.maxHeight, this.maxWidth, this.showSubText=true, this.outerAvatarRadius, this.showMainText=true, this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxHeight,
      width: maxWidth,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color:outerAvatarColor ?? Colors.transparent,width: outerAvatarRadius ?? 2.horizontalScale)
            ),
            child: Padding( 
              padding: EdgeInsets.all(outerAvatarRadius ?? 2.horizontalScale),
              child: avatarChild ?? ImageAvatar(
                showNoAvatar: showNoAvatar,
                avatarPath: avatarPath,
              onTap: onTap,
              url: url,
              radius: (avatarRadius ?? 52.horizontalScale)-(outerAvatarRadius ?? 2.horizontalScale),
                    ),
            ),
          ),
          SizedBox(height: titleGap ?? paddingXXXXS),
          Text(
            mainText ?? '',
            style: mainTextStyle ?? s13W700Dark,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).isVisible(showMainText),
          SizedBox(height: subTextGap ?? paddingXXXXS),
          Text(
            subText ?? '',
            style: subTextStyle ?? s10W400Dark,
          ).isVisible(showSubText),
        ],
      ),
    );
  }
}
