import 'package:flutter/material.dart';
import '../second_level_drowing/draw_screen.dart';

class secondLevel extends StatelessWidget {
  secondLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Draw(),
    );
  }
}
