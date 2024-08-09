import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ideco_app/home/HomePage/Controller/APIServiceProject.dart';

class ProjectController extends GetxController {
  final APIServiceProject apiServiceProject;

  ProjectController(this.apiServiceProject);

  var projectItems = <String, dynamic>{}.obs;
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProjectItems();
  }

  Future<void> fetchProjectItems() async {
    loading.value = true;
    try {
      var items = await apiServiceProject.fetchProject();
      projectItems.value = items;
      // print("wwwwww");
      // print(projectItems.value);
    } catch (e) {
      // print("weeee");
      print(e);
    } finally {
      loading.value = false;
    }
  }
}
