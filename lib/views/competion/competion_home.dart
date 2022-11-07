import 'package:flutter/material.dart';
import 'package:match_day/models/competion.dart';
import 'package:match_day/services/competion_service.dart';
import 'package:match_day/views/competion/competion_list.dart';

import 'competion_create.dart';

class CompetionHome extends StatefulWidget {
  const CompetionHome({super.key});

  @override
  State<CompetionHome> createState() => _CompetionHomeState();
}

class _CompetionHomeState extends State<CompetionHome> {
  final CompetionService competionService = CompetionService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Torneos')),
      body: FutureBuilder<List<Competion>>(
        future: competionService.getAllCompetion(),
        builder: ((context, snapshot) {
          return snapshot.hasData
              ? CompetionList(
                  competions: snapshot.data!,
                )
              : const Center(child: CircularProgressIndicator());
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToCompetionPage,
        child: const Icon(Icons.add),
      ),
    );
  }

  _goToCompetionPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const CompetionCreate();
    }));
  }
}
