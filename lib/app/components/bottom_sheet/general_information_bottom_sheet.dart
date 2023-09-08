import 'package:flutter/material.dart';
import '../../constants/other/padding_and_radius_size.dart';
import '../../theme/text_style/text_style.dart';
import '../button/base_button.dart';
import 'bottom_sheet_widget.dart';

class GeneralInformationBottomSheet<T> extends BottomSheetWidget<T> {
  final VoidCallback onTapFirstBtn;
  final VoidCallback? onTapSecondBtn;
  final String title;
  final String subtitle;
  final String firstBtnText;
  final String? secondBtnText;
  const GeneralInformationBottomSheet({
    Key? key,
    required this.onTapFirstBtn,
    this.onTapSecondBtn,
    required this.firstBtnText,
    this.secondBtnText,
    required this.title,
    required this.subtitle,
  }) : super(
          key: key,
          useRootNavigator: true,
          isScrollControlled: true,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: paddingXL, horizontal: paddingXS),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: s31W700DarkPeachi,
          ),
          const SizedBox(height: paddingXS),
          Text(
            subtitle,
            style: s16W400Dark,
          ),
          const Spacer(),
          BaseButton.primary(onTap: onTapFirstBtn, txt: firstBtnText),
          const SizedBox(height: paddingXXXS),
          BaseButton.secondary(onTap: onTapSecondBtn ?? ()=>Navigator.pop(context), txt: secondBtnText ?? 'No, take me back'),
        ],
      ),
    );
  }
}




///EXAMPLE USAGE

// GeneralInformationBottomSheet(
//                                 title: 'Logout',
//                                 subtitle: 'Are you sure you want to log out of SummerCircle’s app?',
//                                 firstBtnText: 'Yes, log me out',
//                                 secondBtnText: 'No, take me back',
//                                 onTapFirstBtn: () {},
//                                 onTapSecondBtn: () {},
//                               ).openBottomSheet(context: context);