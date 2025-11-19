import 'package:flutter/material.dart';
import '../pages/detail_page.dart';

class SkillItem extends StatelessWidget {
  final String skill;
  const SkillItem({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(title: skill, type: "Skill"),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(6),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              skill,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
