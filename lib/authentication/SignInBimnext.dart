import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:ideco_app/authentication/SignInWithGoogle.dart';
import 'dart:convert';

import 'package:ideco_app/home/homePage.dart';

class Signinbimnext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginFormBimnext(),
    );
  }
}

class LoginFormBimnext extends StatefulWidget {
  @override
  _LoginFormBimnextState createState() => _LoginFormBimnextState();
}

class _LoginFormBimnextState extends State<LoginFormBimnext> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3E7),
      body: SingleChildScrollView( // Bọc toàn bộ nội dung trong SingleChildScrollView
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Đảm bảo Column chỉ chiếm không gian cần thiết
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _logoLogin(),
                const SizedBox(height: 20.0),
                _buildTitle(),
                const SizedBox(height: 20.0),
                _buildEmailField(),
                const SizedBox(height: 20.0),
                _buildPasswordField(),
                const SizedBox(height: 8.0),
                _forgotPasswordField(),
                const SizedBox(height: 20.0),
                _buildLoginButton(),
                const SizedBox(height: 20.0),
                _buildLoginButtonWithGoogle(),
                const SizedBox(height: 20.0),
                _buildLoginButtonWithAutoDesk(),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    try {
      final response = await http.post(   
        Uri.parse('https://172.16.1.58:6868/v2/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print(responseData);

        if (responseData['statusCode'] == 200) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          _showErrorDialog();
        }
      } else {
        print('Response body: ${response.body}');
        _showErrorDialog();
      }
    } catch (error) {
      print("object");
      print(error);
      _showErrorDialog();
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('SORRY'),
          content: const Text('You entered an incorrect username or password.guest @Aa123123'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _logoLogin() {
    return Image.asset(
      'assets/icons/splashhomescreen.png', 
      width: 100, 
      height: 100,
    );
  }


  Widget _buildTitle() {
    return const Text(
      'Đăng Nhập',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Căn chỉnh các thành phần bên trái
      children: <Widget>[
        const Text(
          'Username', // Nhãn phía trên TextField
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        const SizedBox(height: 8.0), // Khoảng cách giữa nhãn và TextField
        TextField(
          controller: _emailController,
          textAlign: TextAlign.start, // Căn chỉnh văn bản bên trong TextField
          decoration: const InputDecoration(
            labelText: 'Email', // Nhãn phía trên TextField
            labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 2.0),
            ),
            filled: true,
            fillColor: Color(0xFFF6F6F6),
          ),
        ),
      ],
    );
  }


  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Căn chỉnh các thành phần bên trái
      children: <Widget>[
        const Text(
          'Password', // Nhãn phía trên TextField
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        const SizedBox(height: 8.0), // Khoảng cách giữa nhãn và TextField
        TextField(
          controller: _passwordController,
          obscureText: _obscureText,
          textAlign: TextAlign.start, // Căn chỉnh văn bản bên trong TextField
          decoration: InputDecoration(
            labelText: 'Password', // Nhãn phía trên TextField
            labelStyle: const TextStyle(color: Color(0xFFBDBDBD)),
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEAF3E7), width: 1.0),
            ),
            filled: true,
            fillColor: const Color(0xFFF6F6F6),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _forgotPasswordField() {
  return Align(
    alignment: Alignment.centerRight, 
    child: TextButton(
      onPressed: () {
        // Thực hiện hành động khi nhấn vào liên kết "Forgot Password?"
        // Ví dụ: điều hướng đến một trang khác
        print('Forgot Password button pressed');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
      },
      child: const Text(
        'Quên mật khẩu?', // Văn bản của liên kết
        style: TextStyle(
          color: Color.fromARGB(255, 4, 255, 75), // Màu của liên kết
          fontSize: 15.0,
        ),
      ),
    ),
  );
}


  Widget _buildLoginButton() {
    return InkWell(
      onTap: _isLoading ? null : _login,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 150.0),
        decoration: BoxDecoration(
          color: const Color(0xFF269947),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Text(
          'Đăng Nhập',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButtonWithGoogle() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInWithGoogle(),
        ));
      },
      child: Container(
        width: 60.0, // Đặt kích thước vòng tròn
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 252, 252, 252), // Màu nền của nút
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Độ lệch của bóng
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            'assets/icons/google_icons.png', // Đường dẫn tới biểu tượng Google
            width: 40.0, // Kích thước của biểu tượng
            height: 40.0,
            fit: BoxFit.contain, // Điều chỉnh kích thước để phù hợp với ô chứa
          ),
        ),
      ),
    );
  }


  Widget _buildLoginButtonWithAutoDesk() {
    return InkWell(
      onTap: _isLoading ? null : _login,
      child: Container(
        width: 60.0, // Đặt kích thước vòng tròn
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 252, 252, 252), // Màu nền của nút
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Độ lệch của bóng
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.g_mobiledata, // Biểu tượng Google (hoặc thay đổi theo ý bạn)
            color: Color.fromARGB(255, 0, 0, 0),
            size: 30.0, // Kích thước của biểu tượng
          ),
        ),
      ),
    );
  }

}
