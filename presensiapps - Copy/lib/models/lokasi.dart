import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Lokasi {
  final double? lat1;
  final double? lat2;
  final double? long1;
  final double? long2;
  Lokasi({
    this.lat1,
    this.lat2,
    this.long1,
    this.long2,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat1': lat1,
      'lat2': lat2,
      'long1': long1,
      'long2': long2,
    };
  }

  factory Lokasi.fromMap(Map<String, dynamic> map) {
    return Lokasi(
      lat1: map['lat1'] != null ? map['lat1'] as double : null,
      lat2: map['lat2'] != null ? map['lat2'] as double : null,
      long1: map['long1'] != null ? map['long1'] as double : null,
      long2: map['long2'] != null ? map['long2'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Lokasi.fromJson(String source) =>
      Lokasi.fromMap(json.decode(source) as Map<String, dynamic>);
}
