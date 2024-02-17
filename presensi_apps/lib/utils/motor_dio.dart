// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import "package:dio/dio.dart";
import "package:servis_apps/models/Motorgetmodel.dart";
import "package:servis_apps/models/merkmodel.dart";
import "package:servis_apps/models/motormodel.dart";

class MotorDio {
  late Dio dio;
  final String baseUrl = "http://okamotor.my.id/api";

  MotorDio() {
    dio = Dio();
  }

  Future<List<Motor>> listmotor(int id) async {
    try {
      final result = await dio.get('$baseUrl/motor/listmotor/$id');
      return (result.data as List)
          .map((e) => Motor.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<Motorgetmodel>> listgetmotor(int id) async {
    try {
      final result = await dio.get('$baseUrl/motor/listgetmotor/$id');
      return (result.data as List)
          .map((e) => Motorgetmodel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future postmotor(Motor item) async {
    try {
      return await dio
          .post(
            "$baseUrl/motor/store",
            data: item.toMap(),
          )
          .then((value) => value.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future delete(Merkmodel item) async {
    try {
      final result = await dio.delete(
        "$baseUrl/motor/delete/${item.idmerk}",
      );
      return result.data;
    } catch (e) {}
  }
}
