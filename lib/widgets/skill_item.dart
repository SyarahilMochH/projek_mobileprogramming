import 'package:flutter/material.dart';

class SkillItem extends StatelessWidget {
  final String skill;
  final Function(String) onClick;

  const SkillItem({
    super.key,
    required this.skill,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(skill);   // ⬅ memanggil fungsi ke SkillPage
      },
      child: Card(
        margin: const EdgeInsets.all(6),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              skill,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
