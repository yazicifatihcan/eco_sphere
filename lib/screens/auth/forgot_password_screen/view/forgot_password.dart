import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../app/components/button/base_button.dart';
import '../../../../app/components/card/bottom_sheet_typed_card.dart';
import '../../../../app/components/input/input_field_with_icon.dart';
import '../../../../app/components/input/input_otp_field.dart';
import '../../../../app/constants/assets/assets.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';
import '../controller/forgot_password_controller.dart';

part 'components/password_reset_first_step.dart';
part 'components/password_reset_second_step.dart';
part 'components/password_reset_third_step.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordController>();
    return GestureDetector(
      onTap: controller.unfocus,
      child: Scaffold(
        key: controller.scaffoldKey,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Obx(
              () => controller.currentStep == 1
                  ? _PasswordResetFirstStep(
                      controller: controller,
                    )
                  : controller.currentStep == 2
                      ? _PasswordResetSecondStep(
                          controller: controller,
                        )
                      : _PasswordResetThirdStep(
                          controller: controller,
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
