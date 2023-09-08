import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final int total;
  final int current;

  const ProgressWidget({
    super.key,
    required this.total,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = (current / total).clamp(0.0, 1.0);

    return Container(
      height: 20,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1), // Gray background for the progress bar
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: FractionallySizedBox(
        widthFactor: percentage,
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary, // Primary color for completed progress
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
