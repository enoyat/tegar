// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import "package:dio/dio.dart";
import "package:servis_apps/models/jenismerk_model.dart";
import "package:servis_apps/models/merkmodel.dart";

class MerkDio {
  late Dio dio;
  final String baseUrl = "http://okamotor.my.id/api";

  MerkDio() {
    dio = Dio();
  }

  Future<List<Merkmodel>> listmerk() async {
    try {
      final result = await dio.get('$baseUrl/merk/listmerk');

      return (result.data as List)
          .map((e) => Merkmodel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<Jenismerkmodel>> listjenismerk(int id) async {
    try {
      final result = await dio.get('$baseUrl/merk/listjenismerk/$id');

      return (result.data as List)
          .map((e) => Jenismerkmodel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<Jenismerkmodel>> listgetjenismerk() async {
    try {
      final result = await dio.get('$baseUrl/merk/listgetjenismerk');

      return (result.data as List)
          .map((e) => Jenismerkmodel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future postmerk(Merkmodel item) async {
    try {
      final result = await dio.post(
        "$baseUrl/merk/store",
        data: item.toMap(),
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future postjenismerk(Jenismerkmodel item) async {
    try {
      final result = await dio.post(
        "$baseUrl/merk/storejenismerk",
        data: item.toMap(),
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> delete(Merkmodel item) async {
    try {
      final result = await dio.delete(
        "$baseUrl/merk/delete/${item.idmerk}",
      );
      return result.data;
    } catch (e) {}
  }

  Future<void> jenismerkdelete(Jenismerkmodel item) async {
    try {
      final result = await dio.delete(
        "$baseUrl/merk/jenismerkdelete/${item.idjenismerk}",
      );
      return result.data;
    } catch (e) {}
  }
}
