import 'dart:convert';
import 'package:http/http.dart' as http;

class APIServiceChat {
  final String baseUrl;
  final String token;

  APIServiceChat(this.baseUrl, this.token);

  Future<List<dynamic>> fetchHeaderItems(String userId) async {
    final url = '$baseUrl/v2/teams-chat/find-all-by-user/$userId';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load header items: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching header items: $e');
      rethrow;
    }
  }
}
