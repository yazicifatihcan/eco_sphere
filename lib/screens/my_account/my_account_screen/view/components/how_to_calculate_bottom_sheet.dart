import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../app/components/bottom_sheet/bottom_sheet_widget.dart';
import '../../../../../app/components/button/base_button.dart';
import '../../../../../app/constants/assets/assets.dart';
import '../../../../../app/constants/other/icon_with_circle_bg.dart';
import '../../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../../app/libs/app/size_config.dart';
import '../../../../../app/theme/text_style/text_style.dart';

class HowToCalculateBottomSheet<T> extends BottomSheetWidget<T> {
  const HowToCalculateBottomSheet({
    Key? key,
  }) : super(
          key: key,
          useRootNavigator: true,
          isScrollControlled: true,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: paddingXL, horizontal: paddingXS).copyWith(top: SizeConfig.safeAreaPadding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconWithCircleBg(
                  padding: EdgeInsets.zero,
                  iconPath: arrowBackIcon,
                  onTap: () => Navigator.pop(context),
                ),
                const SizedBox(width: paddingXS),
                Text('How do we calculate ? ', style: s20W700Dark),
              ],
            ),
            const SizedBox(height: paddingXL),
            SvgPicture.asset(greenLeafIcon,height: 250,width: 250,),
            const SizedBox(height: paddingXL),
            Expanded(
              child: Text(
                'To help you understand your personal ecological impact, we ask you a few simple questions. After your answers are recorded, we will precisely calculate your ecological footprint in kilograms of CO2 emissions. To do this, we utilize reliable parameters and convert your actions into greenhouse gas emissions, the primary contributors to climate change. You are welcome to update your carbon footprint at any time, monitor your progress, and share your CO2 savings results.',
                style: s16W500Dark.copyWith(height: 1.5),
              ),
            ),
            const SizedBox(height: paddingXL),
            BaseButton.primary(
              onTap: () => Navigator.pop(context),
              txt: 'Back',
            ),
            SizedBox(height: SizeConfig.safeAreaPadding.bottom,),
          ],
        ),
      ),
    );
  }
}
