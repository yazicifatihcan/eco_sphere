import 'package:flutter/material.dart' show PageRoute, RouteSettings;
import 'package:flutter_base_project/app/navigation/route/page_route_builder.dart';
import 'package:flutter_base_project/screens/screens.dart';

typedef PageRouteFun = PageRoute Function(RouteSettings);

enum MainScreensEnum {
  init('/'),
  onboardingScreen('/onboarding'),
  loginScreen('/loginScreen'),
  registerScreen('/registerScreen'),
  forgotPasswordScreen('/forgotPasswordScreen'),

  faqScreen('/faqScreen'),
  legalScreen('/legalScreen'),

  mainScreen('/mainScreen');

  const MainScreensEnum(this.path);

  final String path;
}

Map<String, PageRouteFun> mainRoutesMap = {
  MainScreensEnum.init.path: (_) => goToPage(const SplashScreen(), _),
  
  MainScreensEnum.onboardingScreen.path: (_) => goToPage(const OnboardingScreen(), _),
  MainScreensEnum.loginScreen.path: (_) => goToPage(const LoginScreen(), _),
  MainScreensEnum.registerScreen.path: (_) => goToPage(const RegisterScreen(), _),
  MainScreensEnum.forgotPasswordScreen.path: (_) => goToPage(const ForgotPasswordScreen(), _),

  MainScreensEnum.faqScreen.path: (_) => goToPage(const FaqScreen(), _),
  MainScreensEnum.legalScreen.path: (_) => goToPage(const LegalScreen(), _),

  MainScreensEnum.mainScreen.path: (_) => goToPage(const MainScreen(), _),


  
};


final bottomNavigationBarScreens = [
  const HomeScreen(),
  const DiscoverScreen(),
  const ActivityScreen(),
  const CommunityScreen(),
  const MyAccountScreen(),
];
