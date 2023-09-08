part of '../onboarding.dart';

class _BottomNavigationButtons extends StatelessWidget {
  final VoidCallback onTapNext;
  final int currentPage;

  const _BottomNavigationButtons({required this.onTapNext, required this.currentPage});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: List.generate(
                4,
                (index) => DotIndicator(
                      isSelected: index == currentPage,
                    )),
          ),
        ),
        _NextPageButtonWithCircularIndicator(
          onTap: onTapNext,
          currentPercantage: (0.25 * (currentPage + 1)),
        )
      ],
    );
  }
}
