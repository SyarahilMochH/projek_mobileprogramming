import 'package:flutter/material.dart';
import 'hobi_page.dart';
import 'skill_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      ProfilePage(
        onThemeToggle: widget.onThemeToggle,
        isDarkMode: widget.isDarkMode,
      ),
      const HobiPage(),
      const SkillPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Hobi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Skill",
          ),
        ],
      ),
    );
  }
}
