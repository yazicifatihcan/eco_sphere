import 'package:flutter/material.dart';
import '../components/bottom_sheet/general_state_bottom_sheet.dart';
import '../constants/assets/assets.dart';
import '../navigation/route/route_factory.dart';

mixin StateBottomSheetMixin {
  Future<void> showErrorStateBottomSheet({String? message, VoidCallback? onTapFirstBtn, String? firstBtnText, String? title,Widget? subWidget}) async{
    await GeneralStateBottomSheet(
      onTapFirstBtn: onTapFirstBtn ?? () => Navigator.pop(MyRouteFactory.context),
      firstBtnText: firstBtnText ?? 'Try Again',
      title: title ?? 'An Error Occured',
      subWidget: subWidget,
      subtitle: message,
      svgPath: failureStateIllustrationImage,
      isSecondBtnVisible: false,
    ).showBottomSheet(context: MyRouteFactory.context);
  }

  Future<void> showSuccessStateBottomSheet({String? message,String? title,VoidCallback? onTapFirstBtn})async{
    await GeneralStateBottomSheet(
            isSecondBtnVisible: false,
            onTapFirstBtn: onTapFirstBtn ?? () => Navigator.pop(MyRouteFactory.context),
            firstBtnText: 'Done',
            title: title ?? 'Well done!',
            subtitle:  message ?? 'Update succesfully completed.',
            svgPath: successStateIllustrationImage)
        .showBottomSheet(context: MyRouteFactory.context);
  }

  Future<void> showTwoOptionSuccessStateBottomSheet({String? firstBtnText,String? secondBtnText,String? message,VoidCallback? onTapFirstBtn,VoidCallback? onTapSecondBtn})async{
    await GeneralStateBottomSheet(
            isSecondBtnVisible: true,
            onTapFirstBtn: onTapFirstBtn ?? () => Navigator.pop(MyRouteFactory.context),
            firstBtnText: firstBtnText ?? 'Done',
            secondBtnText: secondBtnText ?? 'Back',
            onTapSecondBtn: onTapSecondBtn ?? () => Navigator.pop(MyRouteFactory.context),
            title: 'Well done!',
            subtitle:  message ?? 'Succesfully completed.',
            svgPath: successStateIllustrationImage)
        .showBottomSheet(context: MyRouteFactory.context);
  }

  Future<void> showKidAddedSuccessfullyBottomSheet({required VoidCallback onTapFirstBtn, required VoidCallback onTapSecondBtn}) async{
    GeneralStateBottomSheet(
      secondBtnText: 'I\'m done',
      onTapSecondBtn: onTapSecondBtn,
      onTapFirstBtn: onTapFirstBtn,
      firstBtnText: 'Add another kid',
      title: 'Well done',
      subtitle: 'Kid added succesfully.',
      svgPath: successStateIllustrationImage,
      isSecondBtnVisible: true,
    ).showBottomSheet(context: MyRouteFactory.context);
  }

}
