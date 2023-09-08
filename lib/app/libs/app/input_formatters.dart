import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final unformattedText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    var formattedText = '';
    var index = 0;
    for (var i = 0; i < unformattedText.length; i++) {
      if (i == 2 || i == 4) {
        formattedText += '/';
      }
      if (index < 8) {
        formattedText += unformattedText[index];
        index++;
      }
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
