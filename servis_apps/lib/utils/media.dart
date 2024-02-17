// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import "dart:io";

import "package:dio/dio.dart";

class MediaDio {
  late Dio dio;
  final String baseUrl = "http://okamotor.my.id/api";

  MediaDio() {
    dio = Dio();
  }
  Future uploadmedia(File file) async {
    String fileName = file.path.split('/').last;

    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    try {
      final result = await dio.post(
        "$baseUrl/apimedia",
        data: formData,
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
