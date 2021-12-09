import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Booking {
  Booking({
    required String this.email,
    required String this.namaLengkap,
    required String this.nomorWa,
    required String this.lokasi,
    required DateTime this.tanggal,
    required String this.jenis,
  });

  final String email;
  final String namaLengkap;
  final String nomorWa;
  final String lokasi;
  final DateTime tanggal;
  final String jenis;

  factory Booking.fromJson(String str) => Booking.fromMap(json.decode(str));

  factory Booking.fromMap(Map<String, dynamic> json) => Booking(
        email: json['email'],
        namaLengkap: json['nama_lengkap'],
        nomorWa: json['nomor_wa'],
        lokasi: json['lokasi'],
        tanggal: json['tanggal'],
        jenis: json['jenis'],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "namaLengkap": namaLengkap,
        "nomorWa": nomorWa,
        "lokasi": lokasi,
        "tanggal": tanggal,
        "jenis": jenis,
      };
}
