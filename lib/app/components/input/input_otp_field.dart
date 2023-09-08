import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:get/get.dart';
import '../../constants/other/padding_and_radius_size.dart';
import '../../theme/text_style/text_style.dart';

class InputOtpField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final int codeLength;

  const InputOtpField({
    Key? key,
    required this.onChanged,
    required this.codeLength,
  }) : super(key: key);

  @override
  State<InputOtpField> createState() => _InputOtpFieldState();
}

class _InputOtpFieldState extends State<InputOtpField> {
  late final List<TextEditingController> cCodeList;

  late final List<String> codeList;

  late final List<FocusNode> focusList;

  final spaceCharacter = ' ';

  @override
  void initState() {
    super.initState();
    codeList = List.generate(widget.codeLength, (int index) => '');
    cCodeList = List.generate(widget.codeLength, (int index) => TextEditingController()..text = spaceCharacter);
    focusList = List.generate(widget.codeLength, (int index) => FocusNode()..addListener(() => _listenToFocus(index)));

    /// Son TextBox e karakter girildiğinde unFocus yap
    cCodeList.last.addListener(() {
      if (cCodeList.last.text.trim().isNotEmpty) {
        FocusScope.of(context).unfocus();
      }
    });
    focusList[0].requestFocus();
  }

  @override
  void dispose() {
    for (var element in cCodeList) {
      element.dispose();
    }
    for (var element in focusList) {
      element.dispose();
    }
    super.dispose();
  }

  /// Text filed larda metin girildiğinde bi sontrakine odaklaniyor
  void onChange(int index, String text) {
    codeList[index] = text;
    final code = codeList.reduce((value, element) => value + element);
    widget.onChanged(code.removeAllWhitespace);
    if (codeList[index].isNotEmpty) {
      if (index == focusList.length - 1) {
        return;
      }

      /// Bi sonrakine odaklan
      focusList[index + 1].requestFocus();
    } else {
      if (index == 0) return;

      /// Bi öncekine odaklan
      cCodeList[index].text = spaceCharacter;
      focusList[index - 1].requestFocus();
    }
  }

  /// TextFieldin focus controllunu dinliyoruz
  /// Her focuslamada tüm text i seçiyoruz
  void _listenToFocus(int index) {
    cCodeList[index].selection = TextSelection(baseOffset: 0, extentOffset: cCodeList[index].text.length);
  }

  void onTapTextFields() {
    final index = codeList.indexWhere((element) => element.isEmpty);
    if (index != -1) {
      focusList[index].requestFocus();
    } else {
      focusList.last.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(textSelectionTheme: const TextSelectionThemeData(selectionColor: Colors.transparent, selectionHandleColor: Colors.transparent)),
      child: Row(
        children: List.generate(
          widget.codeLength,
          (index) => Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingXXXS.horizontalScale),
              child: GestureDetector(
                onTap: onTapTextFields,
                child: Material(
                  color: Colors.transparent,
                  child: IgnorePointer(
                    ignoring: true,
                    child: TextFormField(
                      controller: cCodeList[index],
                      style: s16W400Dark,
                      textAlign: TextAlign.center,
                      focusNode: focusList[index],
                      onChanged: (String text) => onChange(index, text),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      maxLength: 1,
                      showCursor: false,
                      decoration: const InputDecoration(counter: SizedBox.shrink(), hintText: '•', isCollapsed: true, isDense: true),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
