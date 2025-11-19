import 'package:flutter/material.dart';
import '../pages/detail_page.dart';

class HobbyItem extends StatelessWidget {
  final String hobby;
  const HobbyItem({super.key, required this.hobby});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(title: hobby, type: "Hobi"),
          ),
        );
      },
      child: Chip(
        label: Text(hobby),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
    );
  }
}
