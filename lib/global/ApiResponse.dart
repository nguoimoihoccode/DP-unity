import 'package:ideco_app/global/User.dart';

class ApiResponse {
  final String accessToken;
  final User user;

  ApiResponse({
    required this.accessToken,
    required this.user,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      accessToken: json['access_token'],
      user: User.fromJson(json['user']),
    );
  }
}