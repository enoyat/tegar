import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PresensiModel {
  final int? idpresensi;
  final int idpegawai;
  final String statuspresensi;
  final String tanggal;
  final String jamdatang;
  final String jampulang;
  final String namapegawai;
  final String nik;
  PresensiModel({
    this.idpresensi,
    required this.idpegawai,
    required this.statuspresensi,
    required this.tanggal,
    required this.jamdatang,
    required this.jampulang,
    required this.namapegawai,
    required this.nik,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idpresensi': idpresensi,
      'idpegawai': idpegawai,
      'statuspresensi': statuspresensi,
      'tanggal': tanggal,
      'jamdatang': jamdatang,
      'jampulang': jampulang,
      'namapegawai': namapegawai,
      'nik': nik,
    };
  }

  factory PresensiModel.fromMap(Map<String, dynamic> map) {
    return PresensiModel(
      idpresensi: map['idpresensi'] != null ? map['idpresensi'] as int : null,
      idpegawai: map['idpegawai'] as int,
      statuspresensi: map['statuspresensi'] as String,
      tanggal: map['tanggal'] as String,
      jamdatang: map['jamdatang'] as String,
      jampulang: map['jampulang'] as String,
      namapegawai: map['namapegawai'] as String,
      nik: map['nik'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PresensiModel.fromJson(String source) =>
      PresensiModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
