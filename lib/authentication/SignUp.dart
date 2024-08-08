import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ideco_app/global/global.dart';
import 'package:ideco_app/home/homePage.dart';
// import 'package:ideco_app/utils/constants/sizes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    'Đăng kí',
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
                const SizedBox(height: 20.0),
                TextField(
                  controller: _firstName,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 22, 19, 19)),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
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
                    labelStyle: TextStyle(color: Color.fromARGB(255, 22, 19, 19)),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
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
                    labelStyle: TextStyle(color: Color.fromARGB(255, 22, 19, 19)),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _phonenumber,
                  decoration: const InputDecoration(
                    labelText: 'Phone number',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 22, 19, 19)),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _password,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 22, 19, 19)),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                    ),
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
                    String password = _password.text;
                    String phoneNumber = _phonenumber.text;
                    String activatedKey = Global.activatedKey;
      
                    if (email.isNotEmpty && firstName.isNotEmpty && lastName.isNotEmpty && username.isNotEmpty) {
                      Map<String, dynamic> signUpData = {
                        'email': email,
                        'firstName': firstName,
                        'lastName': lastName,
                        'username': username,
                        'password': password,
                        'phoneNumber': phoneNumber,
                        'activatedKey': activatedKey,
                      };
      
                      String signUpJson = jsonEncode(signUpData);
      
                      var url = Uri.parse('https://dpuapidev.corebim.com/auth/v1/UserRegister');
                      var response = await http.post(
                        url,
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: signUpJson,
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
                        _showErrorDialog('We have an error, we will try to fix it.');
                      }
                    } else {
                      setState(() {
                        _isLoading = false; // Stop loading if fields are not filled
                      });
      
                      _showErrorDialog('Please enter all field data.');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF269947),
                      borderRadius: BorderRadius.circular(15.0),
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
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
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
