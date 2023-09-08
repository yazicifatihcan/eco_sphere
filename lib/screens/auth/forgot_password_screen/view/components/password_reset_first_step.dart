part of '../forgot_password.dart';

class _PasswordResetFirstStep extends StatelessWidget {
  final ForgotPasswordController controller;
  const _PasswordResetFirstStep({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: paddingXXXXXXXL),
        Expanded(flex: 3,child: SvgPicture.asset(forgotPasswordIllustrationImage)),
        Expanded(
          flex: 7,
          child: BottomSheetTypedCard(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXL),
              child: Form(
                key: controller.fForgotPassword,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Forgot Password?', style: s31W700DarkPeachi),
                    const SizedBox(height: paddingXL),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: paddingXXS),
                      child: Text(
                        'Please enter the email address used to signup, and we’ll send you an OTP!',
                        style: s16W400Dark,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: paddingXL),
                    InputFieldWithIcon.email(
                      controller: controller.cEmail,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => controller.onTapSendMeAnOtp(),
                    ),
                    const SizedBox(height: paddingXL),
                    const Spacer(),
                    BaseButton.primary(
                      onTap: controller.onTapSendMeAnOtp,
                      txt: 'Send me an OTP',
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
        ),
      ],
    );
  }
}
