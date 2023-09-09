part of '../login.dart';

class _LoginForm extends StatelessWidget {
  final LoginController controller;
  const _LoginForm({required this.controller});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BottomSheetTypedCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXL),
          child: Form(
            key: controller.fLogin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: s31W700DarkPeachi,
                ),
                const SizedBox(height: paddingXL),
                InputFieldWithIcon.email(controller: controller.cEmail),
                const SizedBox(height: paddingXL),
                InputFieldWithIcon.password(
                  controller: controller.cPassword,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => controller.onTapLogin(),
                ),
                const SizedBox(height: paddingXL),
                Align(
                  alignment: Alignment.centerRight,
                  child: ClickableText(
                    onTap: controller.onTapForgotPassword,
                    text: 'Forgot your password?',
                    padding: const EdgeInsets.only(right: paddingXS),
                    textStyle: s10W800Primary,
                  ),
                ),
                const Spacer(),
                BaseButton.primary(
                  onTap: controller.onTapLogin,
                  txt: 'Login',
                ),
                const SizedBox(height: paddingXXXS),
                BaseButton.secondary(
                  onTap: controller.onTapIDontHaveAnAccount,
                  txt: 'Dont\'t have an account? Signup!',
                ),
                // BaseButton.withIcon(
                //   svgPath: googleIcon,
                //   onTap: controller.onTapLoginWithGoogle,
                //   txt: 'Login with Google',
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
