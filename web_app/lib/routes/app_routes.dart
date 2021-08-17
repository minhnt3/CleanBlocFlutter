import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/home/home.dart';
import '../ui/login/login.dart';
import '../ui/not_found/not_found.dart';

class AppRoutes {
  const AppRoutes._();

  static const String home = '/';
  static const String login = '/login';
  static const String notFound = '/404';

  static GetPageRoute onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return GetPageRoute(
          routeName: home,
          page: () => HomePage(),
          binding: HomeBinding(),
        );
      case login:
        return GetPageRoute(
          routeName: login,
          page: () => LoginPage(),
          binding: LoginBinding(),
        );
      default:
        return GetPageRoute(
          routeName: notFound,
          page: () => NotFoundPage(),
          binding: NotFoundBinding(),
        );
    }
  }
}
