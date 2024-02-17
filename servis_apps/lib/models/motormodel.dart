import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Motor {
  final int? idmotor;
  final int iduser;
  final String nopolisi;
  final int idmerk;
  final int  idjenismerk;
  Motor({
    this.idmotor,
    required this.iduser,
    required this.nopolisi,
    required this.idmerk,
    required this.idjenismerk,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idmotor': idmotor,
      'iduser': iduser,
      'nopolisi': nopolisi,
      'idmerk': idmerk,
      'idjenismerk': idjenismerk,
    };
  }

  factory Motor.fromMap(Map<String, dynamic> map) {
    return Motor(
      idmotor: map['idmotor'] != null ? map['idmotor'] as int : null,
      iduser: map['iduser'] as int,
      nopolisi: map['nopolisi'] as String,
      idmerk: map['idmerk'] as int,
      idjenismerk: map['idjenismerk'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Motor.fromJson(String source) => Motor.fromMap(json.decode(source) as Map<String, dynamic>);
  }
