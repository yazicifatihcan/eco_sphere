part of '../onboarding.dart';

class _NextPageButtonWithCircularIndicator extends StatelessWidget {
  final VoidCallback onTap;
  final double currentPercantage;
  const _NextPageButtonWithCircularIndicator({required this.onTap, required this.currentPercantage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 60.horizontalScale,
            width: 60.horizontalScale,
            child: CircularProgressIndicator(
              value: currentPercantage,
              strokeWidth: 2,
              backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          CircleAvatar(
            radius: 22.horizontalScale,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: SvgPicture.asset(arrowRightIcon),
          ),
        ],
      ),
    );
  }
}
