import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideco_app/home/ChatPage/Controller/APIServiceChat.dart';
import 'package:ideco_app/home/ChatPage/Controller/HeaderControllerChat.dart';
import 'package:ideco_app/home/ChatPage/GroupChat/GroupChatScreen.dart';
import 'package:ideco_app/home/ChatPage/ProjectChat/ProjectChatScreen.dart';

class Buildheaderchat extends StatelessWidget {
  final String userId = '669a47d035365bb236f30d7f'; // Thay bằng userId thực tế
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2Njk5ZWQzNGM4YTY2MDljYTM5NGQ5ZGUiLCJlbWFpbCI6ImdpYW5nbmd1eWVuLjAxMTIxMEBnbWFpbC5jb20iLCJyb2xlIjoiZW5kX3VzZXIiLCJpYXQiOjE3MjIzMDc2MjYsImV4cCI6MTcyMjQ4MDQyNn0.20SPKKF3uMWB5a6WtwZaRyr6cnqT708aS6XiTA57vHA'; // Thay bằng token thực tế

  @override
  Widget build(BuildContext context) {
    // Lazy load HeaderController khi cần
    Get.lazyPut(() => HeaderController(APIServiceChat('http://172.16.1.58:6868', token), userId));

    final HeaderController controller = Get.find<HeaderController>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() {
        if (controller.loading.value || controller.loadingAnother.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Wrap(
                spacing: 16, // Khoảng cách ngang giữa các mục
                runSpacing: 16, // Khoảng cách dọc giữa các hàng
                children: [
                  ...controller.headerItems.map((item) {
                    return _buildHeaderItem(
                      context,
                      item['title'],
                      item['subtitle'],
                      item['imagePath'],
                      item['page'] == 'project' ? Projectpage() : GroupPage(), // Xác định trang mới dựa trên dữ liệu từ API
                    );
                  }).toList(),
                ],
              ),
            ],
          );
        }
      }),
    );
  }

  Widget _buildHeaderItem(BuildContext context, String title, String subtitle, String imagePath, Widget destinationPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 24,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
