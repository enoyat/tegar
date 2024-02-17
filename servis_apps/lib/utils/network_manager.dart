// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import "package:dio/dio.dart";
import "package:servis_apps/models/mekanik.dart";

class NetworkManager {
  late Dio dio;
  final String baseUrl = "http://okamotor.my.id/api";

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

  Future<List<MekanikModel>> listmekanik() async {
    try {
      final result = await dio.get('$baseUrl/listmekanik');
      return (result.data as List)
          .map((e) => MekanikModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }
}
