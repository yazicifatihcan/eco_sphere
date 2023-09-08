part of '../forgot_password.dart';

class _PasswordResetSecondStep extends StatelessWidget {
  final ForgotPasswordController controller;
  const _PasswordResetSecondStep({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    'Enter One Time Password',
                    style: s31W700DarkPeachi,
                  ),
                  const SizedBox(height: paddingXL),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingXXS),
                    child: Text(
                      'Code has been sent to your email',
                      style: s16W400Dark,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: paddingXL),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        loginPasswordIcon,
                        height: 24.horizontalScale,
                        width: 24.horizontalScale,
                      ),
                      const SizedBox(
                        width: paddingM,
                      ),
                      Expanded(
                        child: InputOtpField(onChanged: controller.onChangeOtpInput, codeLength: 6),
                      ),
                    ],
                  ),
                  const SizedBox(height: paddingXL),
                  const Spacer(),
                  BaseButton.primary(
                    onTap: controller.onTapVerify,
                    txt: 'Verify',
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
    );
  }
}
