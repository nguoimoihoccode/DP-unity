import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ideco_app/global/AuthProvider.dart';
import 'package:ideco_app/home/ChatPage/ChatScreen.dart';
import 'package:ideco_app/home/CloudPage/cloudPage.dart';
import 'package:ideco_app/home/HomePage/HomeScreen.dart';
import 'package:ideco_app/home/NotificationsPage/notificationPage.dart';
import 'package:ideco_app/home/ProfilePage/ProfilePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _selectedIndex = 0;

  // List of widgets for each tab
  final List<Widget> _pages = [
    Homescreen(),
    CloudPage(),
    ChatPage(),
    NotificationScreen(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home, color: Color.fromARGB(255, 3, 255, 12),),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.cloud, color: Color.fromARGB(255, 0, 255, 8),),
            label: 'Cloud',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.message, color: Color.fromARGB(255, 0, 255, 8),),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.notification, color: Color.fromARGB(255, 0, 255, 8),),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle, color: Color.fromARGB(255, 0, 255, 8),),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 255, 4),
        onTap: _onItemTapped,
      ),
    );
  }
}
