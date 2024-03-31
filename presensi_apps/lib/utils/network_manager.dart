// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import "package:dio/dio.dart";

class NetworkManager {
  late Dio dio;
  final String baseUrl = "http://192.168.200.7:8000/api";

  NetworkManager() {
    dio = Dio();
  }
  Future login(String email, String password) async {
    try {
      final result = await dio.post(
        '$baseUrl/login',
        data: {
          "email": email,
          "password": password,
        },
      );
      return result.data;
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }
}
