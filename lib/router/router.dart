import 'package:flutter/material.dart';
import 'package:nascon_prep/router/routes.dart';
import 'package:nascon_prep/screens/chat/chat.dart';
import 'package:nascon_prep/screens/chatbox/chatbox.dart';

final Map<String, Widget Function(dynamic)> appRoutes = {
  AppRoutes.chat: (_) => const ChatScreen(),
  AppRoutes.chatbox: (_) => const ChatboxScreen(),
};

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.chat:
      return FadeRoute(settings: settings, child: const ChatScreen());
    case AppRoutes.chatbox:
      return FadeRoute(settings: settings, child: const ChatboxScreen());

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
