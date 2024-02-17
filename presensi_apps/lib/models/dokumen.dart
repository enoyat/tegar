import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Dokumen {
  final int id;
  final String namadokumen;
  final String? persyaratan;
  Dokumen({
    required this.id,
    required this.namadokumen,
    this.persyaratan,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'namadokumen': namadokumen,
      'persyaratan': persyaratan,
    };
  }

  factory Dokumen.fromMap(Map<String, dynamic> map) {
    return Dokumen(
      id: map['id'] as int,
      namadokumen: map['namadokumen'] as String,
      persyaratan:
          map['persyaratan'] != null ? map['persyaratan'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dokumen.fromJson(String source) =>
      Dokumen.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Dokumen(id: $id, namadokumen: $namadokumen, persyaratan: $persyaratan)';

  Dokumen copyWith({
    int? id,
    String? namadokumen,
    String? persyaratan,
  }) {
    return Dokumen(
      id: id ?? this.id,
      namadokumen: namadokumen ?? this.namadokumen,
      persyaratan: persyaratan ?? this.persyaratan,
    );
  }
}
