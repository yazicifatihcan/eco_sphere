import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_base_project/app/navigation/route/route_factory.dart';

import '../../constants/assets/assets.dart';

/// Uygulama genelinde tüm text style ler buradan çekilmektedir
/// İsimler 'Size - FontWight - Color' Formatında ayarlanmıştır

TextStyle get s10W400Dark => Theme.of(MyRouteFactory.context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400); 

TextStyle get s10W800Primary =>
    Theme.of(MyRouteFactory.context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(MyRouteFactory.context).colorScheme.primary);

TextStyle get s13W700White =>
    Theme.of(MyRouteFactory.context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w700,color: Theme.of(MyRouteFactory.context).colorScheme.surface);

TextStyle get s13W700Dark =>
    Theme.of(MyRouteFactory.context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w700);

TextStyle get s16W400Dark =>
    Theme.of(MyRouteFactory.context).textTheme.bodyLarge!;

TextStyle get s16W500Dark =>
    Theme.of(MyRouteFactory.context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500);    

TextStyle get s16W700Dark =>
    Theme.of(MyRouteFactory.context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700);

TextStyle get s16W700Primary =>
    Theme.of(MyRouteFactory.context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700, color: Theme.of(MyRouteFactory.context).colorScheme.primary);

TextStyle get s20W500Dark =>
    Theme.of(MyRouteFactory.context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500,);

TextStyle get s20W700Dark =>
    Theme.of(MyRouteFactory.context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700,);

TextStyle get s20W700DarkPeachi  => Theme.of(MyRouteFactory.context).textTheme.headlineMedium!.copyWith(
      fontWeight: FontWeight.w700,
      fontFamily: secondaryFontFamily,
    );

TextStyle get s20W800Primary => Theme.of(MyRouteFactory.context)
    .textTheme
    .headlineMedium!
    .copyWith(fontWeight: FontWeight.w800, color: Theme.of(MyRouteFactory.context).colorScheme.primary);

TextStyle get s20W800Dark =>
    Theme.of(MyRouteFactory.context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w800);

TextStyle get s20W800White => Theme.of(MyRouteFactory.context)
    .textTheme
    .headlineMedium!
    .copyWith(fontWeight: FontWeight.w800, color: Theme.of(MyRouteFactory.context).colorScheme.surface);

TextStyle get s25W700DarkPeachi => Theme.of(MyRouteFactory.context).textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 25.horizontalScale,
      fontFamily: secondaryFontFamily,
    );

TextStyle get s31W700DarkPeachi => Theme.of(MyRouteFactory.context).textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: 31.horizontalScale,
      fontFamily: secondaryFontFamily,
    );

TextStyle get s31W700PrimaryPeachi => Theme.of(MyRouteFactory.context).textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: 31.horizontalScale,
      color: Theme.of(MyRouteFactory.context).colorScheme.primary,
      fontFamily: secondaryFontFamily,
    );


TextStyle get s39W700DarkPeachi => Theme.of(MyRouteFactory.context).textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: 39.horizontalScale,
      fontFamily: secondaryFontFamily,
    );
