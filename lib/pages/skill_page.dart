import 'package:flutter/material.dart';
import '../utils/deskripsi_loader.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  String? selectedSkill;
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    data = await DeskripsiLoader.loadDeskripsi();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final skills = ["Flutter", "Kotlin", "UI/UX Design", "Firebase"];

    return Scaffold(
      appBar: AppBar(title: const Text("Skill")),
      body: data == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: skills.map((skill) {
                    return ChoiceChip(
                      label: Text(skill),
                      selected: selectedSkill == skill,
                      onSelected: (_) {
                        setState(() {
                          selectedSkill = skill;
                        });
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20),

                if (selectedSkill != null)
                  Column(
                    children: [
                      // === TAMPILKAN GAMBAR ===
                      Image.asset(
                        data!["skill"][selectedSkill!]["image"],
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 12),

                      // === TAMPILKAN TEKS DESKRIPSI ===
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            data!["skill"][selectedSkill!]["deskripsi"],
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
    );
  }
}
