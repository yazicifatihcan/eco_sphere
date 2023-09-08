import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../app/components/button/base_button.dart';
import '../../../../app/components/button/clckable_text.dart';
import '../../../../app/components/card/bottom_sheet_typed_card.dart';
import '../../../../app/components/input/input_field_with_icon.dart';
import '../../../../app/constants/assets/assets.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';
import '../controller/login_controller.dart';

part 'components/login_form.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
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
                Expanded(flex: 3,child: SvgPicture.asset(loginIllustrationImage,fit: BoxFit.contain,)),
                Expanded(
                  flex: 7,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: _LoginForm(
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
