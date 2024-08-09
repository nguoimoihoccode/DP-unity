import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideco_app/home/HomePage/Controller/APIServiceProject.dart';
import 'package:ideco_app/home/HomePage/Controller/ProjectController.dart';
import 'package:ideco_app/home/HomePage/ProjectScreen/ListProject.dart';
import 'package:ideco_app/home/homePage.dart';

class ProjectSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    // print('Partner Name: ${arguments['partnerName']}');
    
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
              return ListProject(projectController: projectController, arguments: arguments);
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

