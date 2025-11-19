import 'package:flutter/material.dart';

class HobbyItem extends StatelessWidget {
  final String hobby;
  final Function(String) onClick;

  const HobbyItem({
    super.key,
    required this.hobby,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(hobby),
      child: Chip(
        label: Text(hobby),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.15),
      ),
    );
  }
}
