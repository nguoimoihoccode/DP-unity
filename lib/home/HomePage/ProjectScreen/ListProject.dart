import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideco_app/home/homePage.dart';

class ListProjectSelection extends StatelessWidget {
  final List<dynamic> projectItems; // Danh sách dự án

  ListProjectSelection({required this.projectItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projectItems.length,
      itemBuilder: (context, index) {
        final project = projectItems[index];
        final customer = project['customer'];
        final category = project['category'];

        return ExpansionTile(
          title: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Wtf.png'),
            ),
            title: Text(project['name'] ?? 'Không có tên'),
            subtitle: Text(customer != null ? customer['name'] : 'Không có khách hàng'),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              project['status'] ?? 'Unknown', // Sử dụng giá trị mặc định nếu không có
              style: const TextStyle(color: Colors.white),
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MÔ TẢ SƠ LƯỢC:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(project['description'] ?? 'Không có mô tả'),
                  const SizedBox(height: 8),
                  const Text(
                    'ĐỊA CHỈ:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(project['address'] ?? 'Không có địa chỉ'),
                  const SizedBox(height: 8),
                  const Text(
                    'NGÀY TẠO:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(project['createdAt'] ?? 'Không có ngày tạo'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Get.to(() => HomePage(), arguments: project),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Đặt làm mặc định',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
