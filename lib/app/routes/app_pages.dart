import 'package:flutter/material.dart';
import 'package:clothes_store_mobile_app/app/routes/app_routes.dart';

import '../views/splash/splash_view.dart';



abstract class AppPages {
  AppPages._();
  static Map<String, Widget Function(dynamic)> routes = {
    AppRoutes.SPASH: (context) => const SplashView(),
  };
}