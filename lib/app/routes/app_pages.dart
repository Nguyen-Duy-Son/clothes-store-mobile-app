import 'package:flutter/material.dart';
import 'package:clothes_store_mobile_app/app/routes/app_routes.dart';

import '../views/on_boarding/on_boarding_view.dart';
import '../views/sign_up/sign_up_view.dart';
import '../views/splash/splash_view.dart';
import '../views/welcome/welcome_view.dart';



abstract class AppPages {
  AppPages._();
  static Map<String, Widget Function(dynamic)> routes = {
    AppRoutes.SPASH: (context) => const SplashView(),
    AppRoutes.WELCOME: (context) => const WelcomeView(),
    AppRoutes.ONBOARDING: (context) => const OnBoardingView(),
    AppRoutes.SIGNUP: (context) => const SignUpView(),
  };
}