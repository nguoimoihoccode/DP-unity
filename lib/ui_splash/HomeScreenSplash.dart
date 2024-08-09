import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideco_app/authentication/SignIn.dart';
import 'package:ideco_app/authentication/SignInBimnext.dart';
import 'package:ideco_app/home/homePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Đợi 3 giây sau đó chuyển đến trang đăng nhập
    Future.delayed(const Duration(seconds: 1), 
      () => Get.offAll(() => LoginFormBimnext()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3E7),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/splashhomescreen.png', // Đường dẫn của hình ảnh trong thư mục assets
                width: 150, // Kích thước của logo
                height: 150,
              ),
              const SizedBox(height: 20), // Thêm khoảng cách dưới hình ảnh
              Center(
                child: const Text(
                  'Quản lý ứng dụng xây dựng với',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: <Color>[
                      // Colors.red,
                      Colors.orange,
                      Colors.green,
                      Colors.yellow,
                      // Colors.blue,
                      // Colors.indigo,
                      // Colors.purple,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: const Text(
                  'BIMNEXT',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Màu của văn bản, thường là màu trắng để hiển thị gradient
                  ),
                ),
              ),
              const SizedBox(height: 20), // Thêm khoảng cách dưới văn bản cuối cùng
            ],
          ),
        ),
      ),
    );
  }
}
