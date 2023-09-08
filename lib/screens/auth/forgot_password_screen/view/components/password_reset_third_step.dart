part of '../forgot_password.dart';

class _PasswordResetThirdStep extends StatelessWidget {
  final ForgotPasswordController controller;
  const _PasswordResetThirdStep({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.fForgotPassword,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: paddingXXXXXXXL),
          Expanded(flex: 3,child: SvgPicture.asset(enterOtpIllustrationImage)),
          Expanded(
            flex: 7,
            child: BottomSheetTypedCard(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password Reset',
                      style: s31W700DarkPeachi,
                    ),
                    const SizedBox(height: paddingXL),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: paddingXXS),
                      child: Text(
                        'Please enter your new password below!',
                        style: s16W400Dark,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: paddingXL),
                    InputFieldWithIcon.password(
                      controller: controller.cNewPassword,
                      onFieldSubmitted: (_) => controller.onTapCreateNewPassword(),
                      textInputAction: TextInputAction.done,
                      hintText: 'New password',
                    ),
                    const SizedBox(height: paddingXL),
                    const Spacer(),
                    BaseButton.primary(
                      onTap: controller.onTapCreateNewPassword,
                      txt: 'Create my new password',
                    ),
                    const SizedBox(height: paddingXXXS),
                    BaseButton.secondary(
                      onTap: controller.onTapBack,
                      txt: 'Back',
                    ),
                    const SizedBox(height: paddingXL),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
