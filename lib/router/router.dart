import 'package:flutter/material.dart';
import 'package:nascon_prep/router/routes.dart';
import 'package:nascon_prep/screens/home/home.dart';
import 'package:nascon_prep/screens/login/login_page.dart';
import 'package:nascon_prep/screens/test/cloudinary.dart';
// @inject:import

final Map<String, Widget Function(dynamic)> appRoutes = {
  AppRoutes.home: (_) => const HomeScreen(),
  AppRoutes.login: (_) => const LoginPage(),
  AppRoutes.cloud: (_) => CloudinarySDKUpload(),
  // @inject:router-map
};

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return FadeRoute(settings: settings, child: const HomeScreen());
    case AppRoutes.login:
      return FadeRoute(settings: settings, child: const LoginPage());
    case AppRoutes.cloud:
      return FadeRoute(settings: settings, child: CloudinarySDKUpload());
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
