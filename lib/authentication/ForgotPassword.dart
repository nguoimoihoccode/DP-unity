import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Quên mật khẩu',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Color.fromARGB(255, 22, 19, 19)),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF6F6F6),
                    ),
                  ),
                ]
              )
            )
          ]
        ),
      ),
    ),
    );
  }
}