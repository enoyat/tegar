import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pegawai {
  final int idpegawai;
  final String namapegawai;
  final String nik;
  final String email;
  final String alamat;
  final String nohp;
  final int iduser;
  Pegawai({
    required this.idpegawai,
    required this.namapegawai,
    required this.nik,
    required this.email,
    required this.alamat,
    required this.nohp,
    required this.iduser,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idpegawai': idpegawai,
      'namapegawai': namapegawai,
      'nik': nik,
      'email': email,
      'alamat': alamat,
      'nohp': nohp,
      'iduser': iduser,
    };
  }

  factory Pegawai.fromMap(Map<String, dynamic> map) {
    return Pegawai(
      idpegawai: map['idpegawai'] as int,
      namapegawai: map['namapegawai'] as String,
      nik: map['nik'] as String,
      email: map['email'] as String,
      alamat: map['alamat'] as String,
      nohp: map['nohp'] as String,
      iduser: map['iduser'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pegawai.fromJson(String source) =>
      Pegawai.fromMap(json.decode(source) as Map<String, dynamic>);
}
