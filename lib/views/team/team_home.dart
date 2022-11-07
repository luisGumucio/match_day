import 'package:flutter/material.dart';
import 'package:match_day/services/team_service.dart';
import 'package:match_day/views/team/team_create.dart';

import '../../models/team.dart';
import 'team_list.dart';

class TeamHome extends StatefulWidget {
  const TeamHome({super.key});

  @override
  State<TeamHome> createState() => _TeamHomeState();
}

class _TeamHomeState extends State<TeamHome> {
  final TeamService teamService = TeamService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Equipos')),
      body: FutureBuilder<List<Team>>(
        future: teamService.getAllTeam(),
        builder: ((context, snapshot) {
          return snapshot.hasData
              ? TeamList(teams: snapshot.data!)
              : const Center(child: CircularProgressIndicator());
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToTeamCreatePage,
        child: const Icon(Icons.add),
      ),
    );
  }

  _goToTeamCreatePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const TeamCreate();
    }));
  }
}
