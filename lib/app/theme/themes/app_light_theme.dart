import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import '../../constants/assets/assets.dart';
import '../../constants/other/padding_and_radius_size.dart';
import '../color/app_colors.dart';
import '../theme.dart';

class AppLightTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.light;
  @override
  Color backgroundColor = AppColor.background;
  @override
  Color scaffoldBackgroundColor = AppColor.background;
  @override
  IconThemeData accentIconTheme = const IconThemeData(color: Colors.white);
  @override
  IconThemeData primaryIconTheme = const IconThemeData(color: Colors.white);
  @override
  IconThemeData iconTheme = const IconThemeData(color: Colors.black);
  @override
  Color cardColor = AppColor.background;
  @override
  Color bottomAppBarColor = Colors.white;
  @override
  Color dividerColor = AppColor.lightWhite;
  @override
  Color shadowColor = Colors.black26;

  @override
  ColorScheme colorScheme = ColorScheme(
    primary: AppColor.primary,
    onPrimary: AppColor.lightPrimary,
    primaryContainer: AppColor.lightPrimary,
    secondary: AppColor.turkcellYellow,
    onSecondary: AppColor.darkText,
    secondaryContainer: AppColor.darkText,
    surface: AppColor.cardColor,
    onSurface: AppColor.darkText,
    background: AppColor.background,
    onBackground: AppColor.darkText,
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  @override
  ColorScheme buttonColorScheme = const ColorScheme(
    primary: AppColor.primary,
    primaryContainer: AppColor.lightPrimary,
    secondary: AppColor.lightPrimary,
    secondaryContainer: AppColor.lightPrimary,
    surface: Colors.white,
    background: AppColor.primary,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  @override
  CardTheme cardTheme = CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusM)),
    color: AppColor.cardColor,
    margin: EdgeInsets.zero,
  );

  @override
  TextTheme textTheme = TextTheme(
    displaySmall: TextStyle(
      fontSize: 12.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: 13.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
    displayLarge: TextStyle(
      fontSize: 18.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: 15.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
    titleLarge: TextStyle(
      fontSize: 26.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 11.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 10.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
    titleSmall: TextStyle(
      fontSize: 8.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 14.horizontalScale,
      fontWeight: FontWeight.w500,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
  );

  @override
  ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusM),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(AppColor.primary),
      side: MaterialStateProperty.all(
        const BorderSide(color: Colors.transparent),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          color: AppColor.background,
          fontFamily: primaryFontFamily,
          fontWeight: FontWeight.w800,
          fontSize: 20.horizontalScale,
        ),
      ),
    ),
  );
  @override
  InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      vertical: paddingXXXS,
    ),
    filled: true,
    fillColor: Colors.transparent,
    labelStyle: TextStyle(
      fontSize: 14.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: primaryFontFamily,
      color: AppColor.darkText.withOpacity(0.3),
      fontSize: 16.horizontalScale,
    ),
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.darkText.withOpacity(0.3))),
    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.darkText)),
    focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.darkText.withOpacity(0.3))),
    errorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.darkText.withOpacity(0.3))),
  );

  @override
  TextSelectionThemeData textSelectionThemeData = TextSelectionThemeData(
    cursorColor: AppColor.primary,
    selectionColor: AppColor.primary.withOpacity(0.2),
    selectionHandleColor: AppColor.primary,
  );

  @override
  TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      foregroundColor: MaterialStateProperty.all<Color>(AppColor.primary),
      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          color: AppColor.primary,
          fontFamily: primaryFontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 16.horizontalScale,
        ),
      ),
    ),
  );

  @override
  OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: AppColor.darkText)),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          color: AppColor.darkText,
          fontFamily: primaryFontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 16.horizontalScale,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusXL),
        ),
      ),
    ),
  );

  @override
  CheckboxThemeData checkboxThemeData = CheckboxThemeData(
    fillColor: MaterialStateProperty.all<Color?>(Colors.transparent),
    checkColor: MaterialStateProperty.all<Color?>(Colors.white),
    side: const BorderSide(width: 2, color: AppColor.darkText),
  );

  @override
  RadioThemeData radioThemeData = RadioThemeData(
    fillColor: MaterialStateProperty.all<Color>(AppColor.primary),
  );

  @override
  DividerThemeData dividerTheme = DividerThemeData(
    color: AppColor.lightWhite,
    space: 0,
  );

  @override
  AppBarTheme appBarTheme = AppBarTheme(
    titleSpacing: 0,
    elevation: 0,
    color: Colors.transparent,
    titleTextStyle: TextStyle(
      fontSize: 16.horizontalScale,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: primaryFontFamily,
    ),
    centerTitle: false,
    actionsIconTheme: const IconThemeData(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
  );

  @override
  TabBarTheme tabBarTheme = TabBarTheme(
    labelColor: AppColor.primary,
    labelStyle: TextStyle(
      fontSize: 14.horizontalScale,
      fontWeight: FontWeight.w700,
      color: AppColor.primary,
      fontFamily: primaryFontFamily,
    ),
    unselectedLabelColor: AppColor.darkText,
    unselectedLabelStyle: TextStyle(
      fontSize: 14.horizontalScale,
      fontWeight: FontWeight.w700,
      color: AppColor.darkText,
      fontFamily: primaryFontFamily,
    ),
  );

  @override
  Color indicatorColor = AppColor.primary;

  @override
  BottomAppBarTheme bottomAppBarTheme = const BottomAppBarTheme(
    color: Colors.transparent,
    elevation: 0,
  );
}
