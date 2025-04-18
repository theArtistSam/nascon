import 'package:flutter/material.dart';
import 'package:nascon_prep/router/router.dart';
import 'package:nascon_prep/router/routes.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      debugShowMaterialGrid: false,
      navigatorKey: navigatorKey,
      navigatorObservers: [...observers, NavigationHistoryObserver()],
      title: 'Flutter Demo',
      initialRoute: AppRoutes.home,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      routes: appRoutes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
