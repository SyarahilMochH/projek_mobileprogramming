import 'package:flutter/material.dart';
import '../data/deskripsi.dart'; // ⬅️ import deskripsi

class DetailPage extends StatelessWidget {
  final String title;
  final String type; // "Hobi" atau "Skill"

  const DetailPage({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    // ambil deskripsi dari data
    String description = type == "Hobi"
        ? deskripsiHobi[title] ?? "Deskripsi tidak tersedia."
        : deskripsiSkill[title] ?? "Deskripsi tidak tersedia.";

    return Scaffold(
      appBar: AppBar(
        title: Text("$type: $title"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == "Hobi" ? Icons.favorite : Icons.star,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 20),
              Text(
                "$type Detail",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
