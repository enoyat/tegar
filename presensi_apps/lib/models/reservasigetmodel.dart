// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file public_member_api_docs; sort_constructors_first
class ReservasigetModel {
  final int idreservasi;
  final int idpelayanan;
  final int idmekanik;
  final String tglreservasi;
  final String jam;
  final String statusreservasi;
  final String nopolisi;
  final String keterangan;
  final String gambar;
  final int nominal;
  ReservasigetModel({
    required this.idreservasi,
    required this.idpelayanan,
    required this.idmekanik,
    required this.tglreservasi,
    required this.jam,
    required this.statusreservasi,
    required this.nopolisi,
    required this.keterangan,
    required this.gambar,
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
      'nopolisi': nopolisi,
      'keterangan': keterangan,
      'gambar': gambar,
      'nominal': nominal,
    };
  }

  factory ReservasigetModel.fromMap(Map<String, dynamic> map) {
    return ReservasigetModel(
      idreservasi: map['idreservasi'] as int,
      idpelayanan: map['idpelayanan'] as int,
      idmekanik: map['idmekanik'] as int,
      tglreservasi: map['tglreservasi'] as String,
      jam: map['jam'] as String,
      statusreservasi: map['statusreservasi'] as String,
      nopolisi: map['nopolisi'] as String,
      keterangan: map['keterangan'] as String,
      gambar: map['gambar'] as String,
      nominal: map['nominal'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservasigetModel.fromJson(String source) => ReservasigetModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
