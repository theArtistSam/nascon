import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nascon_prep/router/router.dart';
import 'package:nascon_prep/router/routes.dart';
import 'package:nascon_prep/screens/chat/chat.dart';

import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final navigatorKey = GlobalKey<NavigatorState>();
  final List<NavigatorObserver> observers = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      navigatorObservers: [...observers, NavigationHistoryObserver()],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChatScreen(),
      onGenerateRoute: onGenerateRoutes,
      routes: appRoutes,
      initialRoute: AppRoutes.project,
    );
  }
}
