import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/app/extensions/validation_extension.dart';
import 'package:flutter_base_project/app/extensions/widget_extension.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/assets/assets.dart';
import '../../constants/other/padding_and_radius_size.dart';
import '../../libs/app/input_formatters.dart';
import '../../navigation/route/route_factory.dart';


class InputFieldWithIcon extends StatelessWidget {
  final String? iconPath;
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool obscureText;
  final InputDecoration? inputDecoration;
  final List<TextInputFormatter>? inputFormatters;
  const InputFieldWithIcon({
    this.iconPath,
    this.hintText,
    required this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.inputFormatters, this.inputDecoration, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: paddingM),
          child: SvgPicture.asset(
            iconPath ?? '',
            height: 24.horizontalScale,
            width: 24.horizontalScale,
          ),
        ).isVisible(iconPath!=null),
        Expanded(
          child: TextFormField(
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            onFieldSubmitted: onFieldSubmitted,
            textInputAction: textInputAction ?? TextInputAction.next,
            readOnly: readOnly,
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            decoration: inputDecoration ?? InputDecoration(
              hintText: hintText,
              isCollapsed: true,
              suffixIcon: suffixIcon,
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 24,
                minHeight: 24,
                maxWidth: 24,
                minWidth: 24
              ),
            ),
          ),
        ),
      ],
    );
  }

  factory InputFieldWithIcon.email({
    required TextEditingController controller,
    TextInputAction? textInputAction,
    final Function(String?)? onFieldSubmitted,
    bool readOnly = false,
  }) =>
      InputFieldWithIcon(
        iconPath: loginEmailIcon,
        readOnly: readOnly,
        hintText: 'Email address',
        controller: controller,
        validator: (_) => controller.text.isMail(),
        keyboardType: TextInputType.emailAddress,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
      );

  factory InputFieldWithIcon.password({
    required TextEditingController controller,
    TextInputAction? textInputAction,
    final Function(String?)? onFieldSubmitted,
    final String? hintText,
    final bool isChange = false,
  }) =>
      InputFieldWithIcon(
        obscureText: true,
        iconPath: loginPasswordIcon,
        hintText: hintText ?? 'Password',
        controller: controller,
        validator: (_) => controller.text.isValidPassword(isChange: isChange),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
      );

  factory InputFieldWithIcon.passwordRepeat({
    required TextEditingController controller,
    required TextEditingController otherPasswordController,
    TextInputAction? textInputAction,
    final Function(String?)? onFieldSubmitted,
  }) =>
      InputFieldWithIcon(
        iconPath: registerPasswordRepeatIcon,
        hintText: 'Repeat password',
        controller: controller,
        obscureText: true,
        validator: (_) => controller.text.isValidRepeatPassword(otherPasswordController.text),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
      );

  factory InputFieldWithIcon.username({
    required TextEditingController controller,
    bool readOnly = false,
  }) =>
      InputFieldWithIcon(
        iconPath: registerUsernameIcon,
        hintText: 'Username',
        controller: controller,
        readOnly: readOnly,
        validator: (_) => controller.text.isValidUsername(),
        keyboardType: TextInputType.name,
      );

  factory InputFieldWithIcon.name({
    required TextEditingController controller,
    bool readOnly = false,
  }) =>
      InputFieldWithIcon(
        iconPath: addKidNameIcon,
        hintText: 'Name',
        readOnly: readOnly,
        controller: controller,
        validator: (_) => controller.text.isName(),
        keyboardType: TextInputType.name,
      );

  factory InputFieldWithIcon.website({
    required TextEditingController controller,
    bool readOnly = false,
  }) =>
      InputFieldWithIcon(
        iconPath: websiteIcon,
        hintText: 'Website',
        readOnly: readOnly,
        controller: controller,
        validator: (_) => controller.text.isValidWebsite(),
        keyboardType: TextInputType.url,
      );



  factory InputFieldWithIcon.dateField({
    required TextEditingController controller,
    bool readOnly = false,
    String? hintText,
  }) =>
      InputFieldWithIcon(
        inputFormatters: [DateInputFormatter()],
        readOnly: readOnly,
        controller: controller,
        validator: (_) => controller.text.isValidDate(),
        keyboardType: TextInputType.number,
        inputDecoration: InputDecoration(
          contentPadding: const EdgeInsets.all(
            paddingM,
          ),
          hintText: hintText ?? 'From __/__/____',
          isCollapsed: true,
          fillColor: Theme.of(MyRouteFactory.context).colorScheme.surface,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusM), borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusM), borderSide: const BorderSide(color: Colors.transparent)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusM), borderSide: const BorderSide(color: Colors.transparent)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusM), borderSide: const BorderSide(color: Colors.transparent)),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusM), borderSide: const BorderSide(color: Colors.transparent)),
        )
      );
}
