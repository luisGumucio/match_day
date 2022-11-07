

import 'package:flutter/material.dart';
import 'package:match_day/models/competion.dart';

import 'competion_item.dart';

class CompetionList extends StatelessWidget {
  final List<Competion> competions;
  const CompetionList({super.key, required this.competions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: competions.length,
      itemBuilder: ((context, index) {
        return CompetionItem(competion: competions[index]);
      }),
    );
  }
}