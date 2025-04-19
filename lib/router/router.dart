import 'package:flutter/material.dart';
import 'package:nascon_prep/router/routes.dart';
import 'package:nascon_prep/screens/chat/chat.dart';
import 'package:nascon_prep/screens/chatbox/chatbox.dart';
<<<<<<< HEAD
import 'package:nascon_prep/screens/task/task.dart';
=======
import 'package:nascon_prep/screens/project/project.dart';
>>>>>>> fcd5dab9288a410fc792e0d0de84330061d43a8d

final Map<String, Widget Function(dynamic)> appRoutes = {
  AppRoutes.chat: (_) => const ChatScreen(),
  AppRoutes.chatbox: (_) => const ChatboxScreen(),
<<<<<<< HEAD
  AppRoutes.task: (_) => const TaskScreen(),
=======
  AppRoutes.project: (_) => const ProjectScreen(),
>>>>>>> fcd5dab9288a410fc792e0d0de84330061d43a8d
};

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.chat:
      return FadeRoute(settings: settings, child: const ChatScreen());
    case AppRoutes.chatbox:
      return FadeRoute(settings: settings, child: const ChatboxScreen());
<<<<<<< HEAD
    case AppRoutes.task:
      return FadeRoute(settings: settings, child: const TaskScreen());
=======
    case AppRoutes.project:
      return FadeRoute(settings: settings, child: const ProjectScreen());
>>>>>>> fcd5dab9288a410fc792e0d0de84330061d43a8d

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
