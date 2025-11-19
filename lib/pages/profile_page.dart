import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_card.dart';
import '../widgets/hobby_item.dart';
import '../widgets/skill_item.dart';

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
        children: [
          const SizedBox(height: 20),
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
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 20),
          InfoCard(icon: Icons.school, text: "NIM: ${profile.nim}"),
          InfoCard(icon: Icons.email, text: "Email: ${profile.email}"),
          InfoCard(icon: Icons.phone, text: "Telepon: ${profile.telepon}"),
          const SizedBox(height: 16),

          // HOBI
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Hobi", style: Theme.of(context).textTheme.titleLarge),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: profile.hobi.map((h) => HobbyItem(hobby: h)).toList(),
          ),

          const SizedBox(height: 16),

          // SKILL
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Skill", style: Theme.of(context).textTheme.titleLarge),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemCount: profile.skill.length,
            itemBuilder: (context, index) {
              return SkillItem(skill: profile.skill[index]);
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
