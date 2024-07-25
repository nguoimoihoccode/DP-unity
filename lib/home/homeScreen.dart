import 'package:flutter/material.dart';
import 'package:ideco_app/home/ChatPage/ChatScreen.dart';
import 'package:ideco_app/home/CloudPage/cloudPage.dart';
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
    HomeScreens(),
    CloudPage(),
    // const Center(child: Text('Chat Page')),
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
            icon: Icon(Icons.home, color: Colors.black,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud, color: Colors.black,),
            label: 'Cloud',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.black,),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black,),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black,),
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

class HomeScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Xử lý tìm kiếm
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildSectionTitle('Dự án của tôi'),
          SizedBox(height: 8),
          _buildProjectCard('Đường sắt trên cao', 'assets/images/project_image.png'),
          SizedBox(height: 16),
          _buildSectionTitle('Nhóm của tôi'),
          SizedBox(height: 8),
          _buildProjectCard('TVGS - iDECO', 'assets/images/project_image.png'),
          SizedBox(height: 16),
          _buildSectionTitle('Tin tức mới'),
          SizedBox(height: 8),
          _buildNewsCard('Cập nhật tiến độ dự án', 'assets/images/project_image.png'),
          SizedBox(height: 16),
          _buildNewsCard('Thông báo từ ban quản lý', 'assets/images/project_image.png'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildProjectCard(String title, String imagePath) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Xử lý khi nhấn vào dự án
        },
      ),
    );
  }

  Widget _buildNewsCard(String title, String imagePath) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Xử lý khi nhấn vào tin tức
        },
      ),
    );
  }
}