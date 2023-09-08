import 'package:flutter/material.dart';

import '../../constants/other/padding_and_radius_size.dart';


class InputNoteField extends StatelessWidget {
  final String? hintText;
  final Color? fillColor;
  final bool readOnly;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const InputNoteField({super.key, this.hintText, required this.controller, this.fillColor, this.readOnly=false, this.maxLines, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
        controller: controller,
        maxLines: maxLines ?? 7,
        readOnly: readOnly,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(
            paddingM,
          ),
          hintText: hintText ?? 'E.g allergy to...',
          fillColor: fillColor ?? Theme.of(context).colorScheme.background,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusM), borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusM), borderSide: const BorderSide(color: Colors.transparent)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusM), borderSide: const BorderSide(color: Colors.transparent)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusM), borderSide: const BorderSide(color: Colors.transparent)),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusM), borderSide: const BorderSide(color: Colors.transparent)),
        ));
  }
}
