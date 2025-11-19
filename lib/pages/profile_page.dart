import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_card.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const ProfilePage({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final profile = Profile(
      nama: "Syarahil Moch H.",
      nim: "23552011006",
      jurusan: "Teknik Informatika",
      email: "SyarahilMochH@gmail.com",
      telepon: "088222398886",
      hobi: ["Coding", "Gaming", "Mendengarkan Musik"],
      skill: ["Flutter", "Kotlin", "UI/UX Design", "Firebase"],
      status: StatusMahasiswa.aktif,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Mahasiswa"),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: onThemeToggle,
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),

          // FOTO PROFIL
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),

          // NAMA + JURUSAN + STATUS
          Center(
            child: Column(
              children: [
                Text(
                  profile.nama,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(profile.jurusan),
                Text("Status: ${profile.statusText}"),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // INFORMASI DETAIL
          InfoCard(icon: Icons.school, text: "NIM : ${profile.nim}"),
          InfoCard(icon: Icons.email, text: "Email : ${profile.email}"),
          InfoCard(icon: Icons.phone, text: "Telepon : ${profile.telepon}"),

          const SizedBox(height: 20),

          // Informasi tambahan atau catatan
          Text(
            "Gunakan menu di bawah untuk melihat daftar Hobi dan Skill.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
