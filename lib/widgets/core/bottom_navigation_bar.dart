import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nascon_prep/configs/configs.dart';
import 'package:nascon_prep/screens/chat/chat.dart';
import 'package:nascon_prep/screens/dashboard/dashboard.dart';
import 'package:nascon_prep/screens/notification/notification.dart';
import 'package:nascon_prep/screens/setting_one/setting_one.dart';
import 'package:nascon_prep/screens/settings/settings.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  MainHomeScreenState createState() => MainHomeScreenState();
}

class MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = const [
    DashboardScreen(),
    ChatScreen(),
    NotificationScreen(),
    SettingOneScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.purple,
        unselectedItemColor: Colors.blueGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Iconsax.message), label: 'Chat'),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.notification),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
