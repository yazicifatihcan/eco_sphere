import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';
import '../../constants/other/padding_and_radius_size.dart';
import '../../theme/color/app_colors.dart';

class TwoOptionSwitchButton extends StatelessWidget {
  const TwoOptionSwitchButton({
    Key? key,
    required this.firstTitle,
    required this.secondTitle,
    required this.selectedValue,
    required this.onTapSwitch,
  }) : super(key: key);

  final String firstTitle;
  final String secondTitle;
  final int selectedValue;
  final Function(int) onTapSwitch;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiusXS),
        color: AppColor.grey.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(paddingXXXS),
        child: Row(
          children: [
            _SwitchButton(
              onTap: () => onTapSwitch(0),
              title: firstTitle,
              isSelected: selectedValue == 0,
            ),
            _SwitchButton(
              onTap: () => onTapSwitch(1),
              title: secondTitle,
              isSelected: selectedValue == 1,
            ),
          ],
        ),
      ),
    );
  }
}

class _SwitchButton extends StatelessWidget {
  const _SwitchButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.isSelected,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radiusXS),
            color: isSelected ? AppColor.primary : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(paddingXS),
            child: Text(
              title,
              style: s13W700White.copyWith(color: isSelected ? null : Theme.of(context).colorScheme.onSurface),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
