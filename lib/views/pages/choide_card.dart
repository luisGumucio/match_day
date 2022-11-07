import 'package:flutter/material.dart';

import '../../models/choice.dart';

class ChoiceCard extends StatefulWidget {
  final Choice choice;
  late Color? color;
  ChoiceCard({super.key, required this.choice, required this.color});

  @override
  State<ChoiceCard> createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<ChoiceCard> {
  var color = Colors.white;
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
                    child: Icon(widget.choice.icon,
                        size: 90.0, color: Colors.black)),
                Text(widget.choice.title,
                    style: TextStyle(color: Colors.black)),
              ]),
        ),
    );
  }
}
