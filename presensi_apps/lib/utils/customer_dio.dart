import 'package:dio/dio.dart';

import '../models/register.dart';

class CustomerDio {
  late Dio dio;
  final String baseUrl = "http://okamotor.my.id/api";
  CustomerDio() {
    dio = Dio();
  }

  Future register(RegisterModel item) async {
    try {
      return await dio
          .post(
            "$baseUrl/register",
            data: item.toMap(),
          )
          .then((value) => value.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future kirimemail(String email) async {
    try {
      final result = await dio.get(
        "$baseUrl/kirimemail?email=$email",
      );
      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future gantipassword(String email, String password, String token) async {
    try {
      final result = await dio.post(
        '$baseUrl/gantipassword',
        data: {
          "email": email,
          "password": password,
          "token": token,
        },
      );
      return result.data;
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }
}
