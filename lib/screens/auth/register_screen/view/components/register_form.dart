part of '../register.dart';

class _RegisterForm extends StatelessWidget {
  final RegisterController controller;
  const _RegisterForm({required this.controller});
  @override
  Widget build(BuildContext context) {
    return BottomSheetTypedCard(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXL),
          child: Form(
            key: controller.fRegister,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Signup', style: s31W700DarkPeachi),
                const SizedBox(height: paddingXL),
                InputFieldWithIcon.username(
                  controller: controller.cUsername,
                ),
                const SizedBox(height: paddingXL),
                InputFieldWithIcon.email(controller: controller.cEmail),
                const SizedBox(height: paddingXL),
                InputFieldWithIcon.password(controller: controller.cPassword),
                const SizedBox(height: paddingXL),
                InputFieldWithIcon.passwordRepeat(
                    controller: controller.cPasswordRepeat,
                    otherPasswordController: controller.cPassword,
                    onFieldSubmitted: (_) => controller.onTapRegister(),
                    textInputAction: TextInputAction.done),
                const SizedBox(height: paddingXL),
                Center(
                  child: _SignUpAgreementText(
                    onTapPrivacyPolicy: controller.onTapPrivacyPolicy,
                    onTapTandC: controller.onTapTandC,
                  ),
                ),
                const SizedBox(height: paddingXL),
                BaseButton.primary(
                  onTap: controller.onTapRegister,
                  txt: 'Create my free account',
                ),
                const SizedBox(height: paddingXXXS),
                BaseButton.secondary(
                  onTap: controller.onTapIHaveAnAccount,
                  txt: 'Have an account? Login!',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
