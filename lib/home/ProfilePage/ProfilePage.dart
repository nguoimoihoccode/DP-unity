import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final String userName = "NTP";
  final String email = "NTP@example.com";
  final String phoneNumber = "0123456789";
  final String address = "123 Main Street, City, Country";
  final String profileImage = "assets/images/profile.png"; // Đảm bảo rằng bạn đã thêm hình ảnh này vào assets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(profileImage),
              ),
              SizedBox(height: 20),
              Text(
                userName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                email,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                phoneNumber,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                address,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Xử lý sự kiện khi nhấn vào nút chỉnh sửa
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Edit button clicked")),
                  );
                },
                child: Text('Edit Profile'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Xử lý sự kiện khi nhấn vào nút đăng xuất
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Logout button clicked")),
                  );
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
