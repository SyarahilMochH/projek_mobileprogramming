import 'dart:convert';
import 'package:flutter/services.dart';

class DeskripsiLoader {
  static Map<String, dynamic>? _cache;

  // Load JSON hanya sekali (cache)
  static Future<Map<String, dynamic>> loadDeskripsi() async {
    if (_cache != null) return _cache!;

    final String data =
        await rootBundle.loadString('assets/deskripsi.json');
    _cache = json.decode(data);

    return _cache!;
  }
}
