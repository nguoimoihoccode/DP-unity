import 'package:flutter/material.dart';
import 'package:ideco_app/ui_splash/HomeScreenSplash.dart';
import 'package:ideco_app/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      // theme: SystemTheme.lightTheme,
      // darkTheme: SystemTheme.darkTheme,
      home: SplashScreen(), // Hiển thị màn hình Splash Screen trước
    );
  }
}

