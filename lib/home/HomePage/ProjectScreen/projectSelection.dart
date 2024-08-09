import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideco_app/home/HomePage/Controller/APIServiceProject.dart';
import 'package:ideco_app/home/HomePage/Controller/ProjectController.dart';
import 'package:ideco_app/home/homePage.dart';

class ProjectSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    print('Partner Name: ${arguments['partnerName']}');
    
    final Map<dynamic, dynamic>? userInfo = arguments is Map<dynamic, dynamic> ? arguments : null;

    final String token = userInfo?['access_token'];
    final String partnerName = arguments['partnerName'];

    // Khởi tạo controller và fetch dữ liệu
    final ProjectController projectController = Get.put(ProjectController(APIServiceProject('https://bimnextapi-dev.dpunity.com/v2/projects', token)));
    
    // Sử dụng Obx để theo dõi sự thay đổi của projectItems
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn dự án'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (projectController.loading.value) {
          // Hiển thị loading spinner khi dữ liệu đang tải
          return const Center(child: CircularProgressIndicator());
        }

        if (projectController.projectItems['data'] == null || projectController.projectItems['data'].isEmpty) {
          // Hiển thị thông báo nếu không có dự án nào
          return const Center(child: Text('Không có dự án nào'));
        }
        final projectData = projectController.projectItems['data'];
        if (projectData is List) {
          for (var project in projectData) {
            final customer = project['customer'];
            final customerName = customer != null ? customer['name'] : 'Unknown';
            if(customerName == partnerName) {
              return ListView.builder(
                itemCount: projectController.projectItems['data'].length,
                itemBuilder: (context, index) {
                  final project = projectController.projectItems['data'][index];
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
                              onPressed: () => Get.to(() => HomePage(), arguments: arguments),
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
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            else {
              return const Center(child: Text('Không có dự án nào'));
            }
          }
        }
        return const Center(child: Text('Không có dự án nào'));
      }),
    );
  }
}
