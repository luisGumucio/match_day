import 'package:flutter/material.dart';

import '../../models/choice.dart';

class ChoiceCard extends StatelessWidget {
  final Choice choice;
  final Color color;
  const ChoiceCard({super.key, required this.choice, required this.color});

  @override
  Widget build(BuildContext context) {
    return  Card(
        color: color,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Icon(choice.icon,
                        size: 90.0, color: Colors.black)),
                Text(choice.title,
                    style: const TextStyle(color: Colors.black)),
              ]),
        ),
    );
  }
}
