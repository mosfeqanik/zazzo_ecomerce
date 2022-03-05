import 'package:flutter/material.dart';

class RattingStars extends StatelessWidget {
  final int rattings;

  RattingStars({required this.rattings});

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < rattings; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(
      stars,
      style: const TextStyle(fontSize: 16.0),
    );
  }
}
