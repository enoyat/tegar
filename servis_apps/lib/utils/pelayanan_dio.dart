// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import "package:dio/dio.dart";
import "package:servis_apps/models/Pelayanangetmodel.dart";
import "package:servis_apps/models/pelayananmodel.dart";

class PelayananDio {
  late Dio dio;
  final String baseUrl = "http://okamotor.my.id/api";

  PelayananDio() {
    dio = Dio();
  }

  Future<List<PelayanangetModel>> listpelayanan(int id) async {
    try {
      final result = await dio.get('$baseUrl/pelayanan/listpelayanan/$id');
      return (result.data as List)
          .map((e) => PelayanangetModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<PelayanangetModel>> listgetpelayanan() async {
    try {
      final result = await dio.get('$baseUrl/pelayanan/listgetpelayanan');
      return (result.data as List)
          .map((e) => PelayanangetModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future postpelayanan(PelayananModel item) async {
    try {
      return await dio
          .post(
            "$baseUrl/pelayanan/store",
            data: item.toMap(),
          )
          .then((value) => value.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> delete(PelayananModel item) async {
    try {
      final result = await dio.delete(
        "$baseUrl/pelayanan/delete/${item.idmotor}",
      );
      return result.data;
    } catch (e) {}
  }
}
