import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ideco_app/global/AuthProvider.dart';
import 'package:ideco_app/global/User.dart';
import 'package:ideco_app/home/HomePage/PartnerScreen/PartnerSelection.dart';
import 'package:ideco_app/home/HomePage/ProjectScreen/projectSelection.dart';
import 'package:ideco_app/utils/constants/sizes.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final arguments = Get.arguments;
    // Kiểm tra nếu arguments là Map hoặc User
    final Map<String, dynamic>? userInfo = arguments is Map<String, dynamic> ? arguments : null;
    // final User? userData = arguments is User ? arguments : null;

    // Lấy các giá trị từ userInfo hoặc userData
    final String userName = userInfo?['userName'] ?? userInfo?['user']?['fullname'] ?? 'User';
    final profileImage =  "assets/images/Capycapy.png" ; // Cập nhật đường dẫn nếu cần

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: SingleChildScrollView(
          child: Center(
          child: Column(
            children: [
              // Custom AppBar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(profileImage),
                    ),
                    Text(
                      'Hello $userName',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Iconsax.search_normal, color: const Color.fromARGB(255, 0, 0, 0)),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Iconsax.message, color: const Color.fromARGB(255, 0, 0, 0)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Remaining content
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/project_image.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        const Positioned(
                          bottom: 16,
                          left: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   'CÁC CẬP NHẬT MỚI',
                              //   style: TextStyle(
                              //     color: Colors.grey,
                              //     fontSize: 12,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              SizedBox(height: 10),
                              // Text(
                              //   'BIMNEXT nâng cấp phiên bản V3',
                              //   style: TextStyle(
                              //     color: const Color.fromARGB(255, 40, 247, 50),
                              //     fontSize: 24,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // SizedBox(height: 10),
                              // Text(
                              //   'Ngày 22/01/2024 Bimnext chính thức nâng cấp...',
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 14,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Thêm slider ở đây hoặc ở padding trên
              // Padding(
              //   padding: const EdgeInsets.all(TSizes.defaultSpace),
              //   // child: CarouselSlider,
              //   ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 400.0,
                  height: 300.0,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Color.fromARGB(255, 215, 238, 216),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          children: [
                            const Text(
                              'Chưa chọn dự án mặc định!',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () => Get.to(() => PartnerSelectionScreen(), arguments: arguments),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, 
                                backgroundColor: Colors.green, 
                                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                              ),
                              child: const Text(
                                'Chọn Dự Án',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
