import 'package:flutter/widgets.dart';
import 'package:match_day/models/team.dart';

import 'team_item.dart';

class TeamList extends StatelessWidget {
  final List<Team> teams;
  const TeamList({super.key, required this.teams});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: ((context, index) {
        return TeamItem(team: teams[index]);
      }),
    );
  }
}