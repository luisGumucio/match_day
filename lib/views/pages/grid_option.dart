import 'package:flutter/material.dart';

import '../../models/grid_layout.dart';

class GridOptions extends StatelessWidget {
  final GridLayout layout;
  const GridOptions({super.key, required this.layout});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              layout.icon,
              size: 40,
            ),
            Text(
              layout.title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
