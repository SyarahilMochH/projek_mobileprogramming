import 'package:flutter/material.dart';
import '../utils/deskripsi_loader.dart';

class HobiPage extends StatefulWidget {
  const HobiPage({super.key});

  @override
  State<HobiPage> createState() => _HobiPageState();
}

class _HobiPageState extends State<HobiPage> {
  String? selectedHobby;
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
    final hobiList = ["Coding", "Gaming", "Mendengarkan Musik"];

    return Scaffold(
      appBar: AppBar(title: const Text("Hobi")),
      body: data == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: hobiList.map((hobi) {
                    return ChoiceChip(
                      label: Text(hobi),
                      selected: selectedHobby == hobi,
                      onSelected: (_) {
                        setState(() {
                          selectedHobby = hobi;
                        });
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20),

                if (selectedHobby != null)
                  Column(
                    children: [
                      Image.asset(
                        data!["hobi"][selectedHobby!]["image"],
                        height: 150,
                        fit: BoxFit.cover,
                      ),

                      const SizedBox(height: 12),

                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            data!["hobi"][selectedHobby!]["deskripsi"],
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
