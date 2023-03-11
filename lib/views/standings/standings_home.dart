import 'package:flutter/material.dart';
import 'package:match_day/models/competion.dart';
import '../category/category_list_horizontal.dart';
import '../competion/competion_list_horizontal.dart';
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
            buildAppBar('Competiciones'),
            CompetitionListHorizontal(onCompetionSelected: _handleCompetionSelection),
            buildAppBar('Categorias'),
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

  Widget buildAppBar(title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }
  Widget _displayCategory() {
    return compention.id == ''
        ? const Center(child: Text("No hay Categoria seleccionada!"))
        : CategoryListHorizontal(categories: compention.categories, onCategorySelected: _handleCategorySelection);
  }

  void _handleCategorySelection(String newCategoryId) {
    setState(() {
      categoryId = newCategoryId;
    });
  }
  void _handleCompetionSelection(Competion newCompetion) {
    setState(() {
      compention = newCompetion;
    });
  }
}
