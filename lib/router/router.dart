import 'package:flutter/material.dart';
import 'package:nascon_prep/router/routes.dart';
import 'package:nascon_prep/screens/calendar/calendar.dart';
import 'package:nascon_prep/screens/chat/chat.dart';
import 'package:nascon_prep/screens/chatbox/chatbox.dart';
import 'package:nascon_prep/screens/search/search.dart';
import 'package:nascon_prep/screens/setting_one/setting_one.dart';
import 'package:nascon_prep/screens/dashboard/dashboard.dart';
import 'package:nascon_prep/screens/task/task.dart';
import 'package:nascon_prep/screens/project/project.dart';

final Map<String, Widget Function(dynamic)> appRoutes = {
  AppRoutes.chat: (_) => const ChatScreen(),
  AppRoutes.chatbox: (_) => const ChatboxScreen(),
  AppRoutes.task: (_) => const TaskScreen(),
  AppRoutes.project: (_) => const ProjectScreen(),
  AppRoutes.calender: (_) => const CalendarScreen(),
  AppRoutes.search: (_) => const SearchScreen(),
  AppRoutes.settingOne: (_) => const SettingOneScreen(),
  AppRoutes.dashboard: (_) => const DashboardScreen(),
};

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.chat:
      return FadeRoute(settings: settings, child: const ChatScreen());
    case AppRoutes.chatbox:
      return FadeRoute(settings: settings, child: const ChatboxScreen());
    case AppRoutes.task:
      return FadeRoute(settings: settings, child: const TaskScreen());
    case AppRoutes.project:
      return FadeRoute(settings: settings, child: const ProjectScreen());
    case AppRoutes.calender:
      return FadeRoute(settings: settings, child: const CalendarScreen());
    case AppRoutes.search:
      return FadeRoute(settings: settings, child: const SearchScreen());
    case AppRoutes.settingOne:
      return FadeRoute(settings: settings, child: const SettingOneScreen());
    case AppRoutes.dashboard:
      return FadeRoute(settings: settings, child: const DashboardScreen());

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
