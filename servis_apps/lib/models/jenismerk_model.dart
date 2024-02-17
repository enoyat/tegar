import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Jenismerkmodel {
  final int? idjenismerk;
  final String keterangan;
  final int idmerk;
  final String? gambar;
  Jenismerkmodel({
    this.idjenismerk,
    required this.keterangan,
    required this.idmerk,
    this.gambar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idjenismerk': idjenismerk,
      'keterangan': keterangan,
      'idmerk': idmerk,
      'gambar': gambar,
    };
  }

  factory Jenismerkmodel.fromMap(Map<String, dynamic> map) {
    return Jenismerkmodel(
      idjenismerk: map['idjenismerk'] != null ? map['idjenismerk'] as int : null,
      keterangan: map['keterangan'] as String,
      idmerk: map['idmerk'] as int,
      gambar: map['gambar'] != null ? map['gambar'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Jenismerkmodel.fromJson(String source) => Jenismerkmodel.fromMap(json.decode(source) as Map<String, dynamic>);
   }
