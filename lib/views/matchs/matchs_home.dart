import 'package:flutter/material.dart';
import 'package:match_day/services/fixture_service.dart';
import 'package:match_day/views/pages/list_horizontal.dart';

import '../../constant/matchs_constant.dart';
import '../../models/competion.dart';
import '../../models/fixture.dart';
import '../../models/soccert_match.dart';
import '../competion/competion_list_horizontal.dart';
import '../pages/tag.dart';

class MatchsHome extends StatefulWidget {
  const MatchsHome({super.key});

  @override
  State<MatchsHome> createState() => _MatchsHomeState();
}

class _MatchsHomeState extends State<MatchsHome> {
  String categoryId = "";
  Competion compention =
      Competion('', '', DateTime.now(), DateTime.now(), false);
  List<Fixture> fixtures = [];
  FixtureService fixtureService = FixtureService();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            tagTitle('Competiciones'),
            CompetitionListHorizontal(
                onCompetionSelected: _handleCompetionSelection),
            tagTitle('Categorias'),
            _displayCategory(),
            tagTitle('Fixture'),
            _displayFixture(),
            Expanded(
              child: ListView.builder(
                itemCount: matchs.length,
                itemBuilder: (context, index) {
                  return matchTile(matchs[index]);
                },
              ),
            )
          ],
        ));
  }

  void _handleCompetionSelection(newCompetion) {
    setState(() {
      compention = newCompetion;
    });
  }

  void _handleCategorySelection(newCategoryId) {
    setState(() {
      categoryId = newCategoryId.id;
      fixtureService.getAllFixture(categoryId, compention.id!).then((value) {
        setState(() {
          fixtures = fixtures;
        });
      });
    });
  }

  void _handleFixtueSelection(data) {

  }

  Widget _displayCategory() {
    return compention.id == ''
        ? const Center(child: Text("No hay Categoria seleccionada!"))
        : ListHorizontal(
            dataList: compention.categories,
            onSelected: _handleCategorySelection);
  }
  Widget _displayFixture() {
    return categoryId == '' ? const Center(child: Text("No hay Fixture"))
    : ListHorizontal(dataList: [], onSelected: _handleFixtueSelection);
  }

  Widget matchTile(SoccerMatch match) {
    var homeGoal = match.scoreLocal;
    var awayGoal = match.scoreAway;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              match.teamLocal.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
          Image.network(
            match.teamLocal.urlLogo,
            width: 36.0,
          ),
          Expanded(
            child: Text(
              "$homeGoal - $awayGoal",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
          Image.network(
            match.teamAway.urlLogo,
            width: 36.0,
          ),
          Expanded(
            child: Text(
              match.teamAway.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget teamStat(String team, String logoUrl, String teamName) {
  return Expanded(
    child: Column(
      children: [
        Text(
          team,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: Image.network(
            logoUrl,
            width: 54.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          teamName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    ),
  );
}

Widget goalStat(int expandedTime, int homeGoal, int awayGoal) {
  var home = homeGoal;
  var away = awayGoal;
  var elapsed = expandedTime;

  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$elapsed'",
          style: const TextStyle(
            fontSize: 30.0,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "$home - $away",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 36.0,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
