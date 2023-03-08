import 'package:flutter/material.dart';

import '../../../models/team.dart';
import '../../../services/team_service.dart';
import '../../category/category_list_horizontal.dart';
import '../../team/team_list.dart';

class DetailCategoryTeam extends StatefulWidget {
  final String title;
  const DetailCategoryTeam({super.key, required this.title});

  @override
  State<DetailCategoryTeam> createState() => _DetailCategoryTeamState();
}

class _DetailCategoryTeamState extends State<DetailCategoryTeam> {
  String categoryId = "";
  final TeamService teamService = TeamService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: <Widget>[
            buildAppBar(),
            CategoryListHorizontal(
                onCategorySelected: _handleCategorySelection),
                      Expanded(
              child: _categoryTeams())
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return const Text('Categorias',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold));
  }

  void _handleCategorySelection(String newCategoryId) {
    setState(() {
      categoryId = newCategoryId;
    });
  }
  Widget _categoryTeams() {
    return categoryId == ""
        ? const Center(child: Text("No hay equipos!"))
        : _loadTeams();
  }
  
  Widget _loadTeams() {
    return FutureBuilder<List<Team>>(
        future: teamService.getAllTeamByCategoryId(categoryId),
        builder: ((context, snapshot) {
          return snapshot.hasData
              ? TeamList(teams: snapshot.data!)
              : const Center(child: CircularProgressIndicator());
        }),
      );
  }
}
