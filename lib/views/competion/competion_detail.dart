import 'package:flutter/material.dart';
import 'package:match_day/models/grid_layout.dart';
import 'package:match_day/views/competion/competion_detail_menu/detail_stadings.dart';
import 'package:match_day/views/competion/competion_detail_menu/detail_competition_category.dart';
import '../../constant/grid_layout_constant.dart';
import '../../models/competion.dart';
import '../pages/grid_option.dart';
import 'competion_detail_menu/detail_category_team.dart';

class CompetionDetail extends StatefulWidget {
  final Competion competion;
  const CompetionDetail({super.key, required this.competion});

  @override
  State<CompetionDetail> createState() => _CompetionDetailState();
}

class _CompetionDetailState extends State<CompetionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.competion.name)),
      body: Column(
        children: <Widget>[
          widget.competion.isStarted? Container() : ElevatedButton(
            onPressed: widget.competion.isStarted
                ? null
                : () {
                  },
            child: const Text('Publicar'),
          ),
          Expanded(
            child: GridView.extent(
              shrinkWrap: true,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              padding: const EdgeInsets.all(10.0),
              maxCrossAxisExtent: 200,
              children: List.generate(
                  options.length,
                  (index) => GestureDetector(
                        child: GridOptions(
                          layout: options[index],
                        ),
                        onTap: () {
                           goToItemMenu(options[index], widget.competion);
                        },
                      )),
            ),
          ),
        ],
      ),
    );
  }

  goToItemMenu(GridLayout option, Competion competion) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      switch(option.title) {
        case "Equipos":
         DetailCategoryTeam detail = DetailCategoryTeam(competion: competion);
        return detail;
        case "Tabla":
        DetailStadings detailStadings = DetailStadings(competition: competion);
        return detailStadings;
        case "Categorias":
        DetailCompetitionCategory competitionCategory = DetailCompetitionCategory(competion: competion);
        return competitionCategory;
      }
      return Container();
    }
    ));
  }
}
