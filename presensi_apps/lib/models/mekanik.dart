import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MekanikModel {
  final int id;
  final String name;
  MekanikModel({
    required this.id,
    required this.name,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory MekanikModel.fromMap(Map<String, dynamic> map) {
    return MekanikModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MekanikModel.fromJson(String source) => MekanikModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
