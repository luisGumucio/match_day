import 'package:flutter/material.dart';
import 'package:match_day/services/competion_service.dart';

import '../../../models/category.dart';
import '../../../models/competion.dart';
import '../../../services/category_service.dart';
import '../../pages/team_select.dart';

class DetailCompetitionCategory extends StatefulWidget {
  final Competion? competion;
  const DetailCompetitionCategory({super.key, this.competion});

  @override
  State<DetailCompetitionCategory> createState() =>
      _DetailCompetitionCategoryState();
}

class _DetailCompetitionCategoryState extends State<DetailCompetitionCategory> {
  final CategoryService categoryService = CategoryService();
  final CompetionService competionService = CompetionService();
  Category? _categorySelected;

  List<Category> categories = [];
  List<Category> categoriesSelected = [];

    @override
  void initState() {
    super.initState();
    categoriesSelected = widget.competion!.categories;
    categoryService.getAllCategory().then((value) {
      setState(() {
        categories = value;
        _categorySelected = categories.first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.competion!.name)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _getFormCategory(),
          ),
                              ButtonTheme(
                      height: 40.0,
                      minWidth: 200.0,
                      child: ElevatedButton(
                        onPressed: _updateCompetition,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: const Text(
                          'Guardar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
        ],
      ));
  }

  Widget _getFormCategory() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Agrege las categorias',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _getCategory(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      categoriesSelected.clear();
                    });
                  },
                  child: const Text("limpiar")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_categorySelected != null) {
                        categoriesSelected.add(_categorySelected!);
                      }
                    });
                  },
                  child: const Text("Agregar"))
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: categoriesSelected.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                margin: const EdgeInsets.all(2),
                color: Colors.blue[400],
                child: Center(
                    child: Text(
                  categoriesSelected[index].name,
                  style: const TextStyle(fontSize: 18),
                )),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _getCategory() {
    return categories.isEmpty
        ? const CircularProgressIndicator()
        : TeamSelect(
            categories: categories, setCategorySelected: setCategorySelected);
  }

  setCategorySelected(Category category) {
    setState(() {
      _categorySelected = category;
    });
  }

  _updateCompetition() {
    Competion competion = widget.competion!;
    competion.categories = categoriesSelected;
    competionService.updateCompetion(competion);
    Navigator.of(context).pop();
  }
}
