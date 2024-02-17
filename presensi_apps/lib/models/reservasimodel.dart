import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReservasiModel {
  final int? idreservasi;
  final int idpelayanan;
  final int idmekanik;
  final String tglreservasi;
  final String jam;
  final String statusreservasi;
  final String nominal;
  ReservasiModel({
    this.idreservasi,
    required this.idpelayanan,
    required this.idmekanik,
    required this.tglreservasi,
    required this.jam,
    required this.statusreservasi,
    required this.nominal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idreservasi': idreservasi,
      'idpelayanan': idpelayanan,
      'idmekanik': idmekanik,
      'tglreservasi': tglreservasi,
      'jam': jam,
      'statusreservasi': statusreservasi,
      'nominal': nominal,
    };
  }

  factory ReservasiModel.fromMap(Map<String, dynamic> map) {
    return ReservasiModel(
      idreservasi: map['idreservasi'] != null ? map['idreservasi'] as int : null,
      idpelayanan: map['idpelayanan'] as int,
      idmekanik: map['idmekanik'] as int,
      tglreservasi: map['tglreservasi'] as String,
      jam: map['jam'] as String,
      statusreservasi: map['statusreservasi'] as String,
      nominal: map['nominal'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservasiModel.fromJson(String source) => ReservasiModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
