import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../app_settings/app_general_settings.dart';
import '../screens/common/home_screen/home_screen.dart';
import '../screens/common/loading_screen/loading_screen.dart';
import '../screens/common/login_screen/login_screen.dart';
import '../screens/common/not_found_screen/not_found_screen.dart';

class Routes {
  /// COMMON ROUTES

  static RouteConfig loginScreen = RouteConfig(
    path: '/login',
    name: 'Login Screen',
    builder: (context) => const LoginScreen(),
  );

  static RouteConfig homeScreen = RouteConfig(
    path: '/',
    name: 'Home Screen',
    builder: (context) => const HomeScreen(),
  );

  static RouteConfig notFoundScreen = RouteConfig(
    path: '/404',
    name: '404 Not Found',
    builder: (context) => const NotFoundScreen(),
  );

  static RouteConfig loadingScreen = RouteConfig(
      path: '/loading',
      name: 'Loading',
      builder: (context) => const LoadingScreen());

  static List<GoRoute> _generateRoutes() {
    List<RouteConfig> allRoutes = [
      loginScreen,
      homeScreen,
      notFoundScreen,
      loadingScreen,
    ];
    return allRoutes
        .map((routeConfig) => GoRoute(
              path: routeConfig.path,
              builder: (context, state) => routeConfig.builder(context),
            ))
        .toList();
  }

  static final GoRouter router = GoRouter(
    initialLocation:
        DebugConfig.forceDebugScreen ? DebugConfig.debugScreen.path : null,
    routes: _generateRoutes(),
  );
}

class RouteConfig {
  final String path;
  final Widget Function(BuildContext) builder;
  final String name;

  const RouteConfig({
    required this.path,
    required this.builder,
    required this.name,
  });
}
