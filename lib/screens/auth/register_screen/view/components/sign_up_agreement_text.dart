part of '../register.dart';

class _SignUpAgreementText extends StatelessWidget {
  final VoidCallback onTapTandC;
  final VoidCallback onTapPrivacyPolicy;
  const _SignUpAgreementText({required this.onTapTandC, required this.onTapPrivacyPolicy});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: s10W400Dark,
        children: <TextSpan>[
          const TextSpan(
            text: 'By signing up, you agree to our ',
          ),
          TextSpan(text: 'Terms & Conditions', recognizer: TapGestureRecognizer()..onTap = onTapTandC, style: s10W800Primary),
          const TextSpan(
            text: ' and ',
          ),
          TextSpan(text: 'Privacy Policy', recognizer: TapGestureRecognizer()..onTap = onTapPrivacyPolicy, style: s10W800Primary),
        ],
      ),
    );
  }
}
