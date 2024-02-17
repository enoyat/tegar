import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PelayananModel {
  final int? idpelayanan;
  final int iduser;
  final int idmotor;
  final bool pelayanan1;
  final bool pelayanan2;
  final bool pelayanan3;
  final bool pelayanan4;
  final bool pelayanan5;
  final bool pelayanan6;
  final bool pelayanan7;
  final String pelayananlain;
  PelayananModel({
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
    };
  }

  factory PelayananModel.fromMap(Map<String, dynamic> map) {
    return PelayananModel(
      idpelayanan: map['idpelayanan'] != null ? map['idpelayanan'] as int : null,
      iduser: map['iduser'] as int,
      idmotor: map['idmotor'] as int,
      pelayanan1: map['pelayanan1'] as bool,
      pelayanan2: map['pelayanan2'] as bool,
      pelayanan3: map['pelayanan3'] as bool,
      pelayanan4: map['pelayanan4'] as bool,
      pelayanan5: map['pelayanan5'] as bool,
      pelayanan6: map['pelayanan6'] as bool,
      pelayanan7: map['pelayanan7'] as bool,
      pelayananlain: map['pelayananlain'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PelayananModel.fromJson(String source) => PelayananModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
