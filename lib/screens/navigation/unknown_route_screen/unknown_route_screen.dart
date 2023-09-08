import 'package:flutter/material.dart';
import '../../../app/constants/other/padding_and_radius_size.dart';
import '../../../app/theme/text_style/text_style.dart';
import '../../../core/i10n/i10n.dart';

/// Gidilmek istenilen ekran tanımlı değil ise Gösterilen ekran
class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline),
            const SizedBox(height: paddingM),
            Text(
              AppLocalization.getLabels.unknownPageRouteMessageText,
              style: s16W700Dark,
            ),
          ],
        ),
      ),
    );
  }
}
