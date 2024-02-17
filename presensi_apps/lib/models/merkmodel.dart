import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Merkmodel {
  final int? idmerk;
  final String jenismerk;
  Merkmodel({
    this.idmerk,
    required this.jenismerk,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idmerk': idmerk,
      'jenismerk': jenismerk,
    };
  }

  factory Merkmodel.fromMap(Map<String, dynamic> map) {
    return Merkmodel(
      idmerk: map['idmerk'] != null ? map['idmerk'] as int : null,
      jenismerk: map['jenismerk'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Merkmodel.fromJson(String source) => Merkmodel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
