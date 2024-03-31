// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import "package:dio/dio.dart";
import "package:presensi_apps/models/lokasi.dart";
import "package:presensi_apps/models/presensimodel.dart";

class PresensiDio {
  late Dio dio;
  final String baseUrl = "http://192.168.200.7:8000/api";

  PresensiDio() {
    dio = Dio();
  }

  Future<List<PresensiModel>> listpresensi(int id) async {
    try {
      final result = await dio.get('$baseUrl/presensi/listpresensi/$id');

      return (result.data as List)
          .map((e) => PresensiModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future getlokasi() async {
    try {
      final result = await dio.get('$baseUrl/lokasi');
      return result.data;
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<PresensiModel>> listgetpresensiadmin() async {
    try {
      final result = await dio.get('$baseUrl/presensi/listpresensiadmin/');
      return (result.data as List)
          .map((e) => PresensiModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<PresensiModel>> historypresensi(String status) async {
    try {
      final result = await dio.get('$baseUrl/presensi/historypresensi');
      return (result.data as List)
          .map((e) => PresensiModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<PresensiModel>> listgetpresensi(int id, String status) async {
    try {
      final result =
          await dio.get('$baseUrl/presensi/listgetpresensi/$id/$status');
      return (result.data as List)
          .map((e) => PresensiModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future postpresensi(PresensiModel item) async {
    try {
      final result = await dio.post(
        "$baseUrl/presensi/store",
        data: item.toMap(),
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future presensiselesai(PresensiModel item) async {
    try {
      final result = await dio.post(
        "$baseUrl/presensi/presensiselesai",
        data: item.toMap(),
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future presensionproses(PresensiModel item) async {
    try {
      final result = await dio.post(
        "$baseUrl/presensi/presensionproses",
        data: item.toMap(),
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> delete(PresensiModel item) async {
    try {
      final result = await dio.delete(
        "$baseUrl/delete/${item.idpresensi}",
      );
      return result.data;
    } catch (e) {}
  }
}
