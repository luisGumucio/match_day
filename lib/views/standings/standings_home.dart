import 'package:flutter/material.dart';
import 'package:match_day/models/category.dart';

import '../../services/category_service.dart';
import 'table_screen.dart';

class StandingsHome extends StatefulWidget {
  const StandingsHome({Key? key}) : super(key: key);

  @override
  State<StandingsHome> createState() => _StandingsHomeState();
}

class _StandingsHomeState extends State<StandingsHome> {
  final CategoryService _categoryService = CategoryService();
  String categoryId = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        children: <Widget>[
          buildAppBar(),
          _getCategoriesUi(),
          Expanded(
              child: TableScreen(
            categoryId: categoryId,
          ))
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return const Text('Categorias',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold));
  }

  Widget _getCategoriesUi() {
    return FutureBuilder<List<Category>>(
      future: _categoryService.getAllCategory(),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();
        return SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: snapshot.data!.map((doc) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChoiceChip(
                    selectedColor: const Color.fromRGBO(255, 204, 0, 1),
                    labelStyle: TextStyle(
                        color:
                            categoryId == doc.id ? Colors.white : Colors.black),
                    label: Text(
                      doc.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    selected: categoryId == doc.id,
                    onSelected: (selected) {
                      setState(() {
                        categoryId = doc.id;
                      });
                    }),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
