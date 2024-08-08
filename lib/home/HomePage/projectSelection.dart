import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ideco_app/home/ChatPage/Controller/APIServiceChat.dart';
import 'package:ideco_app/home/HomePage/Controller/APIServiceProject.dart';
import 'package:ideco_app/home/HomePage/Controller/ProjectController.dart';
import 'package:ideco_app/home/HomePage/HomeScreen.dart';
import 'package:ideco_app/home/HomePage/UploadHomeScreen.dart';
import 'package:ideco_app/home/homePage.dart';

class ProjectSelectionScreen extends StatelessWidget {

  final List<Map<String, dynamic>> projects = [
    {
      "name": "TEST BIMNEXT V3",
      "username": "NguyenNTT",
      "status": "Hoạt động",
      "details": {
        "description": "Kiểm tra vận hành của V3",
        "address": "294 Nguyễn Trọng Tuyển, Tân Bình, TP. Hồ Chí Minh",
        "date": "09 tháng 11 2022"
      }
    },
    {
      "name": "BIMNEXT",
      "username": "NguyenNTT",
      "status": "Hoạt động",
      "details": {
        "description": "Kiểm tra vận hành của V3",
        "address": "294 Nguyễn Trọng Tuyển, Tân Bình, TP. Hồ Chí Minh",
        "date": "09 tháng 11 2022"
      }
    },
    {"name": "Demo 1",
     "username": "NguyenNTT",
      "status": "Label",
       "details": {
        "description": "Kiểm tra vận hành của V3",
        "address": "294 Nguyễn Trọng Tuyển, Tân Bình, TP. Hồ Chí Minh",
        "date": "09 tháng 11 2022"
      }},
    {"name": "Demo 2",
     "username": "NguyenNTT",
      "status": "Label",
       "details": {
        "description": "Kiểm tra vận hành của V3",
        "address": "294 Nguyễn Trọng Tuyển, Tân Bình, TP. Hồ Chí Minh",
        "date": "09 tháng 11 2022"
      }},
    {"name": "Demo 3",
     "username": "NguyenNTT",
     "status": "Label",
     "details": {
        "description": "Kiểm tra vận hành của V3",
        "address": "294 Nguyễn Trọng Tuyển, Tân Bình, TP. Hồ Chí Minh",
        "date": "09 tháng 11 2022"
      }},
  ];

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final Map<String, dynamic>? userInfo = arguments is Map<String, dynamic> ? arguments : null;

    // final String userName = userInfo?['userName'] ?? userInfo?['user']?['fullname'] ?? 'User';

    // final String userId = userInfo?['user']?['id'];
    final String token = userInfo?['access_token'];
    print("dmmmmmmmmmmmmmmm dung ho tao cai");
    // print('${dotenv.env['PROJECT_URL']}');

    Get.lazyPut(() => ProjectController(APIServiceProject('https://bimnextapi-dev.dpunity.com/v2/projects' , token)));
    final ProjectController controller = Get.find<ProjectController>();
    print(token);
    print(controller);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn dự án'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ExpansionTile(
            title: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Wtf.png'),
              ),
              title: Text(project['name']),
              subtitle: Text(project['username']),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                project['status'],
                style: TextStyle(color: Colors.white),
              ),
            ),
            children: project.containsKey('details')
                ? [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'MÔ TẢ SƠ LƯỢC:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(project['details']['description']),
                          SizedBox(height: 8),
                          const Text(
                            'ĐỊA CHỈ:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(project['details']['address']),
                          SizedBox(height: 8),
                          const Text(
                            'NGÀY TẠO:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(project['details']['date']),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => Get.to (() => HomePage()),
                            child: Text(
                              'Đặt làm mặc định',
                              style:  TextStyle(
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
                  ]
                : [],
          );
        },
      ),
    );
  }
}
