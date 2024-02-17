import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Motorgetmodel {
  final int? idmotor;
  final int iduser;
  final String nopolisi;
  final int idmerk;
  final int  idjenismerk;
  final String? keterangan;
  final String? gambar;
  Motorgetmodel({
    this.idmotor,
    required this.iduser,
    required this.nopolisi,
    required this.idmerk,
    required this.idjenismerk,
    this.keterangan,
    this.gambar,
  });
    

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idmotor': idmotor,
      'iduser': iduser,
      'nopolisi': nopolisi,
      'idmerk': idmerk,
      'idjenismerk': idjenismerk,
      'keterangan': keterangan,
      'gambar': gambar,
    };
  }

  factory Motorgetmodel.fromMap(Map<String, dynamic> map) {
    return Motorgetmodel(
      idmotor: map['idmotor'] != null ? map['idmotor'] as int : null,
      iduser: map['iduser'] as int,
      nopolisi: map['nopolisi'] as String,
      idmerk: map['idmerk'] as int,
      idjenismerk: map['idjenismerk'] as int,
      keterangan: map['keterangan'] != null ? map['keterangan'] as String : null,
      gambar: map['gambar'] != null ? map['gambar'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Motorgetmodel.fromJson(String source) => Motorgetmodel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
