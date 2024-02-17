// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import "package:dio/dio.dart";
import "package:servis_apps/models/reservasigetmodel.dart";
import "package:servis_apps/models/reservasimodel.dart";

class ReservasiDio {
  late Dio dio;
  final String baseUrl = "http://okamotor.my.id/api";

  ReservasiDio() {
    dio = Dio();
  }

  Future<List<ReservasiModel>> listreservasi(int id) async {
    try {
      final result = await dio.get('$baseUrl/reservasi/listreservasi/$id');
      return (result.data as List)
          .map((e) => ReservasiModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<ReservasigetModel>> listgetreservasiadmin() async {
    try {
      final result = await dio.get('$baseUrl/reservasi/listreservasiadmin/');
      return (result.data as List)
          .map((e) => ReservasigetModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<ReservasigetModel>> historyreservasi(String status) async {
    try {
      final result = await dio.get('$baseUrl/reservasi/historyreservasi');
      return (result.data as List)
          .map((e) => ReservasigetModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<ReservasigetModel>> listgetreservasi(
      int id, String status) async {
    try {
      final result =
          await dio.get('$baseUrl/reservasi/listgetreservasi/$id/$status');
      return (result.data as List)
          .map((e) => ReservasigetModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future postReservasi(ReservasiModel item) async {
    try {
      final result = await dio.post(
        "$baseUrl/reservasi/store",
        data: item.toMap(),
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future reservasiselesai(ReservasigetModel item) async {
    try {
      final result = await dio.post(
        "$baseUrl/reservasi/reservasiselesai",
        data: item.toMap(),
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future reservasionproses(ReservasigetModel item) async {
    try {
      final result = await dio.post(
        "$baseUrl/reservasi/reservasionproses",
        data: item.toMap(),
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<void> delete(ReservasiModel item) async {
    try {
      final result = await dio.delete(
        "$baseUrl/delete/${item.idreservasi}",
      );
      return result.data;
    } catch (e) {}
  }
}
