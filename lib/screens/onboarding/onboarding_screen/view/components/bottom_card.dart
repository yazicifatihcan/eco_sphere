part of '../onboarding.dart';

class _OnboardingInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const _OnboardingInfoCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return BottomSheetTypedCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: s39W700DarkPeachi,
            ),
            const SizedBox(height: paddingXS),
            Text(
              subtitle,
              style: s16W400Dark.copyWith(height: 1.3),
            ),
          ],
        ),
      ),
    );
  }
}
