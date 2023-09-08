import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/validation_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app/components/bottom_sheet/bottom_sheet_widget.dart';
import '../../../../../app/components/button/base_button.dart';
import '../../../../../app/components/input/input_field_with_icon.dart';
import '../../../../../app/components/input/input_note_field.dart';
import '../../../../../app/constants/assets/assets.dart';
import '../../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../../app/libs/app/size_config.dart';
import '../../../../../app/theme/text_style/text_style.dart';


class ContactUsBottomSheet<T> extends BottomSheetWidget<T> {
  final VoidCallback onTapSend;
  final GlobalKey<FormState> fKey;
  final TextEditingController cEmail;
  final TextEditingController cContent;
  const ContactUsBottomSheet({
    Key? key,
    required this.onTapSend,
    required this.fKey,
    required this.cEmail,
    required this.cContent, 
  }) : super(
          key: key,
          useRootNavigator: true,
          isScrollControlled: true,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: paddingXS, vertical: paddingXL).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: fKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Contact Us', style: s25W700DarkPeachi),
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(closeIcon)),
                ],
              ),
              const SizedBox(height: paddingXL),
              Text(
                "We're thrilled that you want to reach out to us. Whether you have a question, feedback, or just want to say hello, we're here to listen.",
                style: s16W500Dark,
              ),
              const SizedBox(height: paddingXL),
              InputFieldWithIcon.email(controller: cEmail),
              const SizedBox(height: paddingXL),
              InputNoteField(
                    validator: (_)=>cContent.text.lenghtChecker(8),
                    maxLines: 10,
                    controller: cContent,
                    hintText:
                        'Please describe you request in this field.',
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
              const SizedBox(height: paddingXL,),
              BaseButton.primary(
                txt: 'Send',
                onTap: onTapSend,
              ),
              const SizedBox(height: paddingXS,),
              BaseButton.secondary(
                txt: 'Back',
                onTap: ()=>Navigator.pop(context),
              ),
              SizedBox(height: SizeConfig.safeAreaPadding.bottom,),
            ],
          ),
        ),
      ),
    );
  }
}
