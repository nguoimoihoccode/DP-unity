import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ideco_app/global/global.dart';
import 'package:ideco_app/home/homePage.dart';
import 'package:ideco_app/utils/constants/text_strings.dart';

class RegisterScreen extends StatelessWidget {
  final Map<String, String?> userInfo = Get.arguments;

  RegisterScreen() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay trở lại trang trước đó
          },
        ),
      ),
      body: RegisterForm(email: userInfo['email']),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final String? email;

  RegisterForm({this.email}) : super();

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.email != null) {
      Global.email = widget.email!;
      _emailController.text = widget.email!;
      print('Email: ${Global.email}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Sign Up',
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
                  labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 2.0),
                  ),
                  filled: false,
                  fillColor: Color(0xFFF6F6F6),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _firstName,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 2.0),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF6F6F6),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _lastName,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 2.0),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF6F6F6),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _userName,
                decoration: const InputDecoration(
                  labelText: 'User Name',
                  labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 2.0),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF6F6F6),
                ),
              ),
              const SizedBox(height: 50.0),
              InkWell(
                onTap: () async {
                  setState(() {
                    _isLoading = true; // Start loading
                  });

                  String email = _emailController.text;
                  String firstName = _firstName.text;
                  String lastName = _lastName.text;
                  String username = _userName.text;
                  String activatedKey = Global.activatedKey;
                  print(email);
                  print(firstName);
                  print(lastName);
                  print(username);

                  if (email.isNotEmpty && firstName.isNotEmpty && lastName.isNotEmpty && username.isNotEmpty) {
                    Map<String, dynamic> registerData = {
                      'email': email,
                      'firstName': firstName,
                      'lastName': lastName,
                      'username': username,
                      'activatedKey': activatedKey,
                    };

                    String registerJson = jsonEncode(registerData);

                    var url = Uri.parse('https://dpuapidev.corebim.com/auth/v1/UserSignUpWithGoogle');
                    var response = await http.post(
                      url,
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: registerJson,
                    );

                    setState(() {
                      _isLoading = false; // Stop loading
                    });

                    if (response.statusCode == 200) {
                      var responseData = jsonDecode(response.body);
                      if (responseData['statusCode'] == 200) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else {
                        _showErrorDialog('We have an error, we will try to fix it.');
                      }
                    } else {
                      print('API request failed with status: ${response.statusCode}');
                      _showErrorDialog('We have an error, we will try to fix it.');
                    }
                  } else {
                    setState(() {
                      _isLoading = false; // Stop loading if fields are not filled
                    });

                    print('Please fill all fields');
                    _showErrorDialog('Please enter all field data.');
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 150.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF269947),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
        if (_isLoading)
          Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('SORRY'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
