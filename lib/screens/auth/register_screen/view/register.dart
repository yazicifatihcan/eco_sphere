import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../app/components/button/base_button.dart';
import '../../../../app/components/card/bottom_sheet_typed_card.dart';
import '../../../../app/components/input/input_field_with_icon.dart';
import '../../../../app/constants/assets/assets.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';
import '../controller/register_controller.dart';

part 'components/register_form.dart';
part 'components/sign_up_agreement_text.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return GestureDetector(
      onTap: controller.unfocus,
      child: Scaffold(
        key: controller.scaffoldKey,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: paddingXXXXXXXL),
                Expanded(flex: 3,child: SvgPicture.asset(registerIllustrationImage)),
                Expanded(flex: 7,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: _RegisterForm(
                      controller: controller,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
