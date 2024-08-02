import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ideco_app/global/AuthProvider.dart';
import 'package:ideco_app/home/HomePage/PartnerSelection.dart';
import 'package:ideco_app/home/HomePage/projectSelection.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lấy dữ liệu từ Get.arguments
    final arguments = Get.arguments;

    // Kiểm tra nếu arguments là Map hoặc UserData
    final Map<String, String?>? userInfo = arguments is Map<String, String?> ? arguments : null;
    final UserData? userData = arguments is UserData ? arguments : null;

    // Lấy các giá trị từ userInfo hoặc userData
    final userName = userData?.fullName ?? userInfo?['userName'] ?? null;
    final profileImage = 'assets/images/Capycapy.png';

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 225, 225),
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage(profileImage),
        ),
        
        title: Text('Hello $userName'),
        actions: [
          IconButton(
            icon: Icon(Iconsax.search_normal),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Iconsax.message),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                    Positioned(
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Chưa chọn dự án mặc định!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => Get.to(() => PartnerSelectionScreen()),
                        child: Text('Chọn Dự Án'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
