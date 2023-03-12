import 'package:flutter/material.dart';
import 'package:match_day/models/competion.dart';
import 'package:match_day/views/pages/list_horizontal.dart';
import '../competion/competion_list_horizontal.dart';
import '../pages/tag.dart';
import 'table_screen.dart';

class StandingsHome extends StatefulWidget {
  const StandingsHome({Key? key}) : super(key: key);

  @override
  State<StandingsHome> createState() => _StandingsHomeState();
}

class _StandingsHomeState extends State<StandingsHome> {
  String categoryId = "";
  Competion compention = Competion('', '', DateTime.now(), DateTime.now(), false);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: <Widget>[
            tagTitle('Competiciones'),
            CompetitionListHorizontal(onCompetionSelected: _handleCompetionSelection),
            tagTitle('Categorias'),
            _displayCategory(),
            Expanded(
                child: TableScreen(
              categoryId: categoryId,
              compentionId: compention.id!
            ))
          ],
        ),
      ),
    );
  }


  Widget _displayCategory() {
    return compention.id == ''
        ? const Center(child: Text("No hay Categoria seleccionada!"))
        : ListHorizontal(dataList: compention.categories, onSelected: _handleCategorySelection);
        // : CategoryListHorizontal(categories: compention.categories, onCategorySelected: _handleCategorySelection);
  }

  void _handleCategorySelection(newCategoryId) {
    setState(() {
      categoryId = newCategoryId.id;
    });
  }
  void _handleCompetionSelection(newCompetion) {
    setState(() {
      compention = newCompetion;
    });
  }
}
