part of '../my_account.dart'; 

class ChartLegendItem extends StatelessWidget {
  final String title;
  final Color color;
  const ChartLegendItem({super.key, required this.title,required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: SizedBox(
            height: 13.horizontalScale,
            width: 13.horizontalScale,
          ),
        ),
        const SizedBox(width: paddingXXXS),
        Expanded(child: Text(title, style: s16W400Dark,textAlign: TextAlign.start,)),
      ],
    );
  }
}
