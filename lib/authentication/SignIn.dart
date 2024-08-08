import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ideco_app/authentication/ForgotPassword.dart';
import 'package:ideco_app/authentication/SignInWithGoogle.dart';
import 'package:ideco_app/authentication/SignUp.dart';
import 'package:ideco_app/global/AuthProvider.dart';
import 'dart:convert';

import 'package:ideco_app/home/homePage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3E7),
      body: SafeArea(
        child: SingleChildScrollView( // Bọc toàn bộ nội dung trong SingleChildScrollView
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Đảm bảo Column chỉ chiếm không gian cần thiết
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  _logoLogin(),
                  const SizedBox(height: 10.0),
                  _buildTitle(),
                  const SizedBox(height: 10.0),
                  _buildEmailField(),
                  const SizedBox(height: 10.0),
                  _buildPasswordField(),
                  const SizedBox(height: 8.0),
                  _forgotPasswordField(),
                  const SizedBox(height: 10.0),
                  _buildLoginButton(),
                  // const SizedBox(height: 5.0),
                  _buildSignUp(),
                  const SizedBox(height: 20.0),
                  _buildLine(),
                  const SizedBox(height: 20.0),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLoginButtonWithGoogle(),
                        const SizedBox(height: 20.0,width: 20.0,),
                        _buildLoginButtonWithAutoDesk(),
                        const SizedBox(height: 20.0, width: 20.0,),
                      ],
                    ),
                  ),
                ],
              ),
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
      // Gọi API để đăng nhập
      final response = await http.post(
        Uri.parse('https://authdev.corebim.com/auth/v1/UserLogin'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'usernameOrEmail': email,
          'password': password,
          'authType': 1,
        }),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print(responseData);

        if (responseData['statusCode'] == 200) {
          var data = responseData['data'];
          var accessToken = data['accessToken'];

          // chuyển token sang JWT
          var decodedToken = JwtDecoder.decode(accessToken);
          //Lấy thông tin từ decodedToken để lấy thông tin của người dùng
          var nameIdentifier = decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'];
          print('Name Identifier: $nameIdentifier');

          // Gọi API để lấy thông tin người dùng bằng nameIdentifier
          final userResponse = await http.get(
            Uri.parse('https://dpuapidev.corebim.com/auth/v1/UserGetById/$nameIdentifier'),
            headers: {
              'Authorization': 'Bearer $accessToken',
              'Content-Type': 'application/json',
            },
          );

          if (userResponse.statusCode == 200) {
            var userResponseData = jsonDecode(userResponse.body);
            print("object");
            print(userResponseData);

            if (userResponseData['statusCode'] == 200) {
              var userDataDetails = userResponseData['data'];

              // Tạo đối tượng UserData với thông tin chi tiết
              var userData = UserData(
                nameIdentifier: nameIdentifier,
                accessToken: accessToken,
                firstName: userDataDetails['firstName'],
                lastName: userDataDetails['lastName'],
                fullName: userDataDetails['fullName'],
                phoneNumber: userDataDetails['phoneNumber'],
                username: userDataDetails['username'],
                email: userDataDetails['email'],
              );
              print(userData);
              // Lưu token vào SharedPreferences
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('accessToken', accessToken);

              // Điều hướng đến HomePage và truyền dữ liệu qua arguments
              Get.offAll(() => HomePage(),arguments: userData);
            } else {
              print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
              _showErrorDialog();
            }
          } else {
            print("kkkkkkkkkkkk");
            print('User data response body: ${userResponse.body}');
            _showErrorDialog();
          }
        } else {
          print("dmmm");
          _showErrorDialog();
        }
      } else {
        print('Login response body: ${response.body}');
        _showErrorDialog();
      }
    } catch (error) {
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
      'assets/icons/splashhomescreen.png', // Đường dẫn của hình ảnh trong thư mục assets
      width: 100, // Kích thước của logo
      height: 100,
    );
  }

  Widget _buildTitle() {
    return const Align(
      child: Center(
        child: Text( 
          'Đăng Nhập',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
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
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        const SizedBox(height: 8.0), // Khoảng cách giữa nhãn và TextField
        TextField(
          controller: _emailController,
          textAlign: TextAlign.start, // Căn chỉnh văn bản bên trong TextField
          decoration: const InputDecoration(
            labelText: 'Username', // Nhãn phía trên TextField
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
            fontSize: 14.0,
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
        onPressed: () => Get.to(() => ForgotPasswordScreen()), // Tạo trang forgotPassWord
        child: const Text(
          'Quên mật khẩu?', // Văn bản của liên kết
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), // Màu của liên kết
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
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        decoration: BoxDecoration(
          color: const Color(0xFF269947),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: const Center(
          child: Text(
            'Đăng Nhập',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildSignUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Căn chỉnh các thành phần bên trái
      children: <Widget>[
        TextButton(
          onPressed: () => Get.to(() => SignUpScreen()),
          child: const Text(
            'Chưa có tài khoản, đăng kí',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), // Màu của liên kết
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLine() {
    return Stack(
      alignment: Alignment.center, // Căn giữa các phần tử trong Stack
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Khoảng trắng hai bên văn bản
          child: Container(
            height: 1.0, // Chiều cao của đường thẳng
            color: Colors.black, // Màu của đường thẳng
            width: double.infinity, // Chiều rộng của đường thẳng
          ),
        ),
        const Text(
          'Or signin by',
          style: TextStyle(
            backgroundColor: Colors.white,
            color: Color.fromARGB(255, 0, 0, 0), // Màu của văn bản
            fontSize: 17.0,
          ),
        ),
      ],
    );
  }


  Widget _buildLoginButtonWithGoogle() {
    return InkWell(
      onTap: () => Get.to(() => SignInWithGoogle()),
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
