import 'package:flutter/material.dart';
import '../category/category_list_horizontal.dart';
import 'table_screen.dart';

class StandingsHome extends StatefulWidget {
  const StandingsHome({Key? key}) : super(key: key);

  @override
  State<StandingsHome> createState() => _StandingsHomeState();
}

class _StandingsHomeState extends State<StandingsHome> {
  String categoryId = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        children: <Widget>[
          buildAppBar(),
          CategoryListHorizontal(onCategorySelected: _handleCategorySelection),
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

  void _handleCategorySelection(String newCategoryId) {
    setState(() {
      categoryId = newCategoryId;
    });
  }
}
