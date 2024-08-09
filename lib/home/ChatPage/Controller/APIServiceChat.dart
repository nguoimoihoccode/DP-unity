import 'dart:convert';
import 'package:http/http.dart' as http;

class APIServiceChat {
  final String baseUrl;
  final String token;

  APIServiceChat(this.baseUrl, this.token);

  Future<List<dynamic>> fetchHeaderItems(String userId) async {
    final url = 'https://bimnextapi-dev.dpunity.com/v2/teams-chat/find-all-by-user/${userId}';
    print(url);
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print('1');

      if (response.statusCode == 200) {
        // Nếu thành công trả về List các nhóm chat
        print(json.decode(response.body));
        return json.decode(response.body);
      } else {
        print('3');
        throw Exception('Failed to load header items: ${response.statusCode}');
      }
    } catch (e) {
      print('4');
      print('Error occurred while fetching header items: $e');
      rethrow;
    }
  }
}
