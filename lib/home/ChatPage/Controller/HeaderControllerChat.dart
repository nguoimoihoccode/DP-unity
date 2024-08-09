import 'package:get/get.dart';
import 'package:ideco_app/home/ChatPage/Controller/APIServiceChat.dart';

class HeaderController extends GetxController {
  final APIServiceChat apiService;
  final String userId;

  HeaderController(this.apiService, this.userId);

  var headerItems = <dynamic>[].obs;
  var loading = false.obs;
  var loadingAnother = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHeaderItems();
  }

  Future<void> fetchHeaderItems() async {
    loading.value = true;
    try {
      print('5');
      var items = await apiService.fetchHeaderItems(userId);
      headerItems.value = items;
      print(items);
    } catch (e) {
      print('6');
      print(e);
    } finally {
      loading.value = false;
    }
  }

}
