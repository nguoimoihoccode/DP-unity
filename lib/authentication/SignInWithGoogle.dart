import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ideco_app/authentication/RegisterForm.dart';
import 'package:ideco_app/home/homePage.dart';

class SignInWithGoogle extends StatefulWidget {
  const SignInWithGoogle({super.key});

  @override
  State<SignInWithGoogle> createState() => _SignInWithGoogleState();
}

class _SignInWithGoogleState extends State<SignInWithGoogle> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoading = false;
  String? _email;

  Future<Map<String, String?>?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        print("User canceled the sign-in");
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final Map<String, String?> userInfo = {
        'accessToken': googleAuth.accessToken,
        'idToken': googleAuth.idToken,
        'userId': googleUser.id,
        'userName': googleUser.displayName,
        'email': googleUser.email,
      };
      print(userInfo);

      _email = googleUser.email; // Cập nhật email để dùng trong đăng nhập

      await _loginWithGoogle(userInfo);
      return userInfo;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

  Future<void> _loginWithGoogle(Map<String, String?> userInfo) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://dpuapidev.corebim.com/auth/v1/UserSigninWithGoogle'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': _email,
        }),
      );
      var responseData = jsonDecode(response.body);
      print(responseData);

      if (response.statusCode == 200) {
        if (responseData['statusCode'] == 200) {
          Get.offAll(() => HomePage(), arguments: userInfo);
        } else {
          _showErrorDialog();
        }
      } else {
        Get.offAll(() => RegisterScreen(), arguments: userInfo);
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
          content: const Text('You entered an incorrect username or password.'),
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

  // void showRegisterDialog(BuildContext context, Map<String, String?> userInfo) {
  //   final _firstnameController = TextEditingController();
  //   final _lastnameController = TextEditingController();
  //   final _usernameController = TextEditingController();

  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('This email does not have an account yet.'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //               controller: _firstnameController,
  //               decoration: InputDecoration(
  //                 labelText: 'First Name',
  //               ),
  //             ),
  //             TextField(
  //               controller: _lastnameController,
  //               decoration: InputDecoration(
  //                 labelText: 'Last Name',
  //               ),
  //             ),
  //             TextField(
  //               controller: _usernameController,
  //               decoration: InputDecoration(
  //                 labelText: 'Username',
  //               ),
  //             ),
  //             TextField(
  //               controller: TextEditingController(text: _email),
  //               decoration: InputDecoration(
  //                 labelText: 'Email',
  //               ),
  //               readOnly: true,
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Cancel'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () async {
  //               // Handle data here
  //               String firstname = _firstnameController.text;
  //               String lastname = _lastnameController.text;
  //               String username = _usernameController.text;

  //               print('First Name: $firstname');
  //               print('Last Name: $lastname');
  //               print('Username: $username');
  //               print('Email: $_email');

  //               if (firstname.isNotEmpty && lastname.isNotEmpty && username.isNotEmpty) {
  //                 Map<String, dynamic> registerData = {
  //                   'email': _email,
  //                   'firstName': firstname,
  //                   'lastName': lastname,
  //                   'username': username,
  //                   // 'activatedKey': activatedKey,
  //                 };

  //                 String registerJson = jsonEncode(registerData);

  //                 var url = Uri.parse('https://dpuapidev.corebim.com/auth/v1/UserSignUpWithGoogle');
  //                 var response = await http.post(
  //                   url,
  //                   headers: <String, String>{
  //                     'Content-Type': 'application/json; charset=UTF-8',
  //                   },
  //                   body: registerJson,
  //                 );

  //                 if (response.statusCode == 200) {
  //                   var responseData = jsonDecode(response.body);
  //                   print(responseData);
  //                   print('API request successful!');
  //                   if (responseData['statusCode'] == 200) {
  //                     Navigator.of(context).pushAndRemoveUntil(
  //                       MaterialPageRoute(builder: (context) => HomePage()),
  //                       (Route<dynamic> route) => false,
  //                     );
  //                   } else {
  //                     _showErrorDialog();
  //                   }
  //                 } else {
  //                   print('API request failed with status: ${response.statusCode}');
  //                 }
  //               } else {
  //                 print('Please fill all fields');
  //               }
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Submit'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Sign-In')),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  final userInfo = await _signInWithGoogle();
                  if (userInfo != null) {
                    print('Signed in with email: ${userInfo['email']}');
                  }
                },
                child: Text('Sign in with Google'),
              ),
      ),
    );
  }
}
