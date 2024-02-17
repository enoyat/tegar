import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final int iduser;
  final String email;
  final String username;
  final bool status;
  User({
    required this.iduser,
    required this.email,
    required this.username,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iduser': iduser,
      'email': email,
      'username': username,
      'status': status,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      iduser: map['iduser'] as int,
      email: map['email'] as String,
      username: map['username'] as String,
      status: map['status'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
