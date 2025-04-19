import 'package:flutter/material.dart';
import 'package:nascon_prep/router/routes.dart';
import 'package:nascon_prep/screens/splash/splash.dart';
// @inject:import

final Map<String, Widget Function(dynamic)> appRoutes = {
  AppRoutes.splash: (_) => const SplashScreen(),
};

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return FadeRoute(settings: settings, child: const SplashScreen());
    // @inject:router-case
    default:
      return null;
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  FadeRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          return FadeTransition(opacity: ani1, child: child);
        },
      );
}
