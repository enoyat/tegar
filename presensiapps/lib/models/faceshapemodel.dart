import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FaceShapeModel {
  final int idpegawai;
  final double faceshape;
  FaceShapeModel({
    required this.idpegawai,
    required this.faceshape,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idpegawai': idpegawai,
      'faceshape': faceshape,
    };
  }

  factory FaceShapeModel.fromMap(Map<String, dynamic> map) {
    return FaceShapeModel(
      idpegawai: map['idpegawai'] as int,
      faceshape: map['faceshape'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory FaceShapeModel.fromJson(String source) =>
      FaceShapeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
