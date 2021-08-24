import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_routes.dart';

class RouteGuard extends GetMiddleware {
  final GetHasLoginUseCase _getHasLoginUseCase;

  RouteGuard(this._getHasLoginUseCase);

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (!AppRoutes.paths.contains(route)) {
      return const RouteSettings(name: AppRoutes.notFound);
    }

    if (!_getHasLoginUseCase()) {
      return const RouteSettings(name: AppRoutes.login);
    }

    return RouteSettings(name: route);
  }
}
