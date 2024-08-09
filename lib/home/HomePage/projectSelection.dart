import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideco_app/home/HomePage/Controller/APIServiceProject.dart';
import 'package:ideco_app/home/HomePage/Controller/ProjectController.dart';
import 'package:ideco_app/home/homePage.dart';

class ProjectSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final Map<String, dynamic>? userInfo = arguments is Map<String, dynamic> ? arguments : null;

    final String token = userInfo?['access_token'];

    // Khởi tạo controller và fetch dữ liệu
    final ProjectController projectController = Get.put(ProjectController(APIServiceProject('https://bimnextapi-dev.dpunity.com/v2/projects', token)));
    
    // Sử dụng Obx để theo dõi sự thay đổi của projectItems
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn dự án'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (projectController.loading.value) {
          // Hiển thị loading spinner khi dữ liệu đang tải
          return Center(child: CircularProgressIndicator());
        }

        if (projectController.projectItems['data'] == null || projectController.projectItems['data'].isEmpty) {
          // Hiển thị thông báo nếu không có dự án nào
          return Center(child: Text('Không có dự án nào'));
        }

        // Hiển thị danh sách các dự án khi dữ liệu đã tải xong
        return ListView.builder(
          itemCount: projectController.projectItems['data'].length,
          itemBuilder: (context, index) {
            final project = projectController.projectItems['data'][index];
            final customer = project['customer'];
            final category = project['category'];

            return ExpansionTile(
              title: ListTile(
                leading: CircleAvatar(
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  project['status'] ?? 'Unknown', // Sử dụng giá trị mặc định nếu không có
                  style: TextStyle(color: Colors.white),
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
                      SizedBox(height: 8),
                      const Text(
                        'ĐỊA CHỈ:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(project['address'] ?? 'Không có địa chỉ'),
                      SizedBox(height: 8),
                      const Text(
                        'NGÀY TẠO:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(project['createdAt'] ?? 'Không có ngày tạo'),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => Get.to(() => HomePage()),
                        child: Text(
                          'Đặt làm mặc định',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
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
      }),
    );
  }
}
