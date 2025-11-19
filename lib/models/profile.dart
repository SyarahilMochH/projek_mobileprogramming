import 'package:flutter/material.dart';

enum StatusMahasiswa { aktif, cuti, lulus }

class Profile {
  final String nama;
  final String nim;
  final String jurusan;
  final String email;
  final String telepon;
  final List<String> hobi;
  final List<String> skill;
  final StatusMahasiswa status;

  Profile({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.email,
    required this.telepon,
    required this.hobi,
    required this.skill,
    required this.status,
  });

  /// Mengubah enum menjadi teks untuk UI
  String get statusText {
    switch (status) {
      case StatusMahasiswa.aktif:
        return "Aktif";
      case StatusMahasiswa.cuti:
        return "Cuti";
      case StatusMahasiswa.lulus:
        return "Lulus";
      default:
        return "-";
    }
  }
}
