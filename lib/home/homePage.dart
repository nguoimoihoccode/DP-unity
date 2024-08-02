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
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home, color: Colors.black,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.cloud, color: Colors.black,),
            label: 'Cloud',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.message, color: Colors.black,),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.notification, color: Colors.black,),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle, color: Colors.black,),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
      ),
    );
  }
}