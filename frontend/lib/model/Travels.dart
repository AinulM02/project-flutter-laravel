// To parse this JSON data, do
//
//     final travels = travelsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Travels travelsFromJson(String str) => Travels.fromJson(json.decode(str));

String travelsToJson(Travels data) => json.encode(data.toJson());

class Travels {
  Travels({
    required this.status,
    required this.data,
  });

  bool status;
  List<Travel> data;

  factory Travels.fromJson(Map<String, dynamic> json) => Travels(
        status: json["status"],
        data: List<Travel>.from(json["data"].map((x) => Travel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Travel {
  Travel({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.hargaTiket,
    required this.jamOperasional,
    required this.imageUrl,
    required this.kota,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String nama;
  String deskripsi;
  int hargaTiket;
  String jamOperasional;
  String imageUrl;
  String kota;
  DateTime createdAt;
  DateTime updatedAt;

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        hargaTiket: json["harga_tiket"],
        jamOperasional: json["jam_operasional"],
        imageUrl: json["image_url"],
        kota: json["kota"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "harga_tiket": hargaTiket,
        "jam_operasional": jamOperasional,
        "image_url": imageUrl,
        "kota": kota,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
