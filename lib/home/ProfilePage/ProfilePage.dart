import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideco_app/authentication/SignIn.dart';
import 'package:ideco_app/global/AuthProvider.dart';
import 'package:ideco_app/home/ProfilePage/editprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lấy UserData từ Get.arguments
    final arguments = Get.arguments;

    // Kiểm tra nếu arguments là Map hoặc UserData
    final Map<String, String?>? userInfo = arguments is Map<String, String?> ? arguments : null;
    final UserData? userData = arguments is UserData ? arguments : null;

    // Lấy các giá trị từ userInfo hoặc userData
    final userName = userData?.fullName ?? userInfo?['userName'] ?? 'Guest';
    final email = userInfo?['email'] ?? 'NTP@example.com';
    final phoneNumber = userInfo?['phoneNumber'] ?? 'null';
    final address = userInfo?['address'] ?? '123 Main Street, City, Country';
    final profileImage = 'assets/images/Capycapy.png';

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
                backgroundImage: AssetImage(profileImage), // Giữ nguyên hình ảnh hoặc thay đổi nếu cần
              ),
              SizedBox(height: 20),
              Text(
                userName, // Sử dụng fullName từ UserData
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                email, // Sử dụng email từ UserData
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                phoneNumber, // Sử dụng phoneNumber từ UserData
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                address, // Có thể thay đổi nếu thông tin địa chỉ có sẵn
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const Editprofile());
                },
                child: Text('Edit Profile'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Xử lý sự kiện khi nhấn vào nút đăng xuất
                  _logout(context);
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm đăng xuất
  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken'); // Xóa token khỏi SharedPreferences

    // Điều hướng về màn hình đăng nhập
    Get.offAll(() => LoginScreen());
    // Hiển thị thông báo đăng xuất thành công
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Successfully logged out")),
    );
  }
}
