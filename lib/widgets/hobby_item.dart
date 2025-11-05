import 'package:flutter/material.dart';

class HobbyItem extends StatelessWidget {
  final String hobby;
  const HobbyItem({super.key, required this.hobby});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(hobby),
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
    );
  }
}
