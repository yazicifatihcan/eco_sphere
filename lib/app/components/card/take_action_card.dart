import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/constants/assets/assets.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/other/padding_and_radius_size.dart';
import '../../theme/text_style/text_style.dart';

class InviteFriendCard extends StatelessWidget {
  const InviteFriendCard({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(paddingXS),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('What did you do today ?',style: s20W800Primary,),
              const SizedBox(height:paddingXS),
              Row(
                children: [
                  Expanded(child: Text('Take Action!',style: s16W500Dark,textAlign: TextAlign.start,)),
                  const Icon(Icons.lock_clock),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}