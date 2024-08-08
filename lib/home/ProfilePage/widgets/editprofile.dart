import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ideco_app/home/ProfilePage/widgets/editprofile_form.dart';
import 'package:ideco_app/utils/constants/sizes.dart';
import 'package:ideco_app/utils/constants/text_strings.dart';
import 'dart:convert';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final arguments = Get.arguments;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> _updateProfile(String userId, String userName, String fullname) async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final response = await http.get(
        Uri.parse('https://bimnextapi-dev.dpunity.com/v2/users/65b70520ea7f66e9a560eece'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Xử lý phản hồi từ API
        print('Profile updated successfully: $data');
        Get.back();
      } else {
        setState(() {
          errorMessage = 'Lỗi API: ${response.statusCode}';
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Lỗi kết nối: $error';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? userInfo = arguments is Map<String, dynamic> ? arguments : null;
    final String userName = userInfo?['userName'] ?? userInfo?['user']?['fullname'] ?? 'User';
    final String userId = userInfo?['userID'] ?? userInfo?['user']?['id'] ?? 'null';
    final String fullname = userInfo?['userID'] ?? userInfo?['user']?['fullname'] ?? 'null';

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(TTexts.EditprofileTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const EditForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Divider
              // FormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    _updateProfile(userId, userName,fullname);
                  },
                  child: const Text(
                    'Change Profile',
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              if (isLoading) const Center(child: CircularProgressIndicator()),
              if (errorMessage.isNotEmpty) Center(child: Text(errorMessage, style: TextStyle(color: Colors.red))),
            ],
          ),
        ),
      ),
    );
  }
}
