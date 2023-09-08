
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widget_extension.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/other/padding_and_radius_size.dart';
import '../../libs/app/size_config.dart';
import '../../theme/text_style/text_style.dart';
import '../button/base_button.dart';
import '../card/bottom_sheet_typed_card.dart';
import 'bottom_sheet_widget.dart';

class GeneralStateBottomSheet<T> extends BottomSheetWidget<T> {
  final VoidCallback onTapFirstBtn;
  final VoidCallback? onTapSecondBtn;
  final String title;
  final String? subtitle;
  final Widget? subWidget;
  final String firstBtnText;
  final String? secondBtnText;
  final bool isSecondBtnVisible;
  final String svgPath;
  const GeneralStateBottomSheet( 
      {Key? key,
      required this.onTapFirstBtn,
      this.subWidget,
      this.isSecondBtnVisible = true,
      this.onTapSecondBtn,
      required this.firstBtnText,
      this.secondBtnText,
      required this.title,
      required this.subtitle,
      required this.svgPath})
      : super(
          key: key,
          useRootNavigator: true,
          isScrollControlled: true,
          enableDrag: false
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: paddingXXXXXXXL),
              Expanded(child: SvgPicture.asset(svgPath)),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomSheetTypedCard(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXL),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            subWidget ??
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: s31W700DarkPeachi,
                                ),
                                const SizedBox(height: paddingXS),
                                Text(
                              subtitle!,
                                style: s16W400Dark.copyWith(height: 1.5),
                                ),
                              ],
                            ),
                            const Spacer(),
                            BaseButton.primary(onTap: onTapFirstBtn, txt: firstBtnText),
                            Padding(
                              padding: const EdgeInsets.only(top: paddingXXXS),
                              child: BaseButton.secondary(onTap: onTapSecondBtn, txt: secondBtnText ?? ''),
                            ).isVisible(isSecondBtnVisible),
                            SizedBox(height: SizeConfig.safeAreaPadding.bottom,),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


///EXAMPLE USAGE
// GeneralStateBottomSheet(
//                                 onTapFirstBtn: () {},
//                                 onTapSecondBtn: () => Navigator.pop(context),
//                                 firstBtnText: 'Okay',
//                                 secondBtnText: 'Done',
//                                 title: 'Well done!',
//                                 subtitle: 'Optimal synergize alarming big ballpark beef. Driving own ladder users individual.',
//                                 svgPath: notificationStateIllustrationImage)
//                             .showBottomSheet(context: context);