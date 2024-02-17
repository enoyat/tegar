import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PelayanangetModel {
  final int? idpelayanan;
  final int iduser;
  final int idmotor;
  final int pelayanan1;
  final int pelayanan2;
  final int pelayanan3;
  final int pelayanan4;
  final int pelayanan5;
  final int pelayanan6;
  final int pelayanan7;
  final String pelayananlain;
  final String nopolisi;
  final String statuspelayanan;
  PelayanangetModel({
    this.idpelayanan,
    required this.iduser,
    required this.idmotor,
    required this.pelayanan1,
    required this.pelayanan2,
    required this.pelayanan3,
    required this.pelayanan4,
    required this.pelayanan5,
    required this.pelayanan6,
    required this.pelayanan7,
    required this.pelayananlain,
    required this.nopolisi,
    required this.statuspelayanan,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idpelayanan': idpelayanan,
      'iduser': iduser,
      'idmotor': idmotor,
      'pelayanan1': pelayanan1,
      'pelayanan2': pelayanan2,
      'pelayanan3': pelayanan3,
      'pelayanan4': pelayanan4,
      'pelayanan5': pelayanan5,
      'pelayanan6': pelayanan6,
      'pelayanan7': pelayanan7,
      'pelayananlain': pelayananlain,
      'nopolisi': nopolisi,
      'statuspelayanan': statuspelayanan,
    };
  }

  factory PelayanangetModel.fromMap(Map<String, dynamic> map) {
    return PelayanangetModel(
      idpelayanan: map['idpelayanan'] != null ? map['idpelayanan'] as int : null,
      iduser: map['iduser'] as int,
      idmotor: map['idmotor'] as int,
      pelayanan1: map['pelayanan1'] as int,
      pelayanan2: map['pelayanan2'] as int,
      pelayanan3: map['pelayanan3'] as int,
      pelayanan4: map['pelayanan4'] as int,
      pelayanan5: map['pelayanan5'] as int,
      pelayanan6: map['pelayanan6'] as int,
      pelayanan7: map['pelayanan7'] as int,
      pelayananlain: map['pelayananlain'] as String,
      nopolisi: map['nopolisi'] as String,
      statuspelayanan: map['statuspelayanan'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PelayanangetModel.fromJson(String source) => PelayanangetModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
