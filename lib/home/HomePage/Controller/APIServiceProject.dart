import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class APIServiceProject {
  final String baseUrl;
  final String token;

  APIServiceProject(this.baseUrl, this.token);

  Future<Map<String, dynamic>> fetchProject() async {
    final url = 'https://bimnextapi-dev.dpunity.com/v2/projects';
    print('hehe');
    // print(url);
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'accept': '*/*',
          'Authorization': 'Bearer $token',
        },
      );
      print("wait");
      

      if (response.statusCode == 200) {
        print("konichiwa");
        return json.decode(response.body);
      } else {
        print("dmmmmm");
        throw Exception('Failed to load header items: ${response.statusCode}');
      }
    } catch (e) {
      print("Cay vl");
      print('Error occurred while fetching header items: $e');
      rethrow;
    }
  }
}
