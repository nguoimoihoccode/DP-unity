import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideco_app/ui_splash/HomeScreenSplash.dart';
import 'package:ideco_app/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      // theme: SystemTheme.lightTheme,
      // darkTheme: SystemTheme.darkTheme,
      home: SplashScreen(), // Hiển thị màn hình Splash Screen trước
    );
  }
}

