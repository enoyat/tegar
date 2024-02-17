import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterModel {
  final int? id;
  final String name;
  final String email;
  final String gender;
  final String alamat;
  final String nohp;
  final String password;
  RegisterModel({
    this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.alamat,
    required this.nohp,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'alamat': alamat,
      'nohp': nohp,
      'password': password,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      email: map['email'] as String,
      gender: map['gender'] as String,
      alamat: map['alamat'] as String,
      nohp: map['nohp'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
