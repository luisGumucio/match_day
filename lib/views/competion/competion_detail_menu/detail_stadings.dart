import 'package:flutter/material.dart';
import 'package:match_day/views/pages/list_horizontal.dart';

import '../../../models/competion.dart';
import '../../standings/table_screen.dart';

class DetailStadings extends StatefulWidget {
  final Competion competition;
  const DetailStadings({super.key, required this.competition});

  @override
  State<DetailStadings> createState() => _DetailStadingsState();
}

class _DetailStadingsState extends State<DetailStadings> {
  String categoryId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Material(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            children: <Widget>[
              buildAppBar('Categorias'),
              _displayCategory(),
              Expanded(
                  child: TableScreen(
                      categoryId: categoryId,
                      compentionId: widget.competition.id!))
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayCategory() {
    return widget.competition.id == ""
        ? const Center(child: Text("No hay Categoria seleccionada!"))
        : ListHorizontal(
            dataList: widget.competition.categories,
            onSelected: _handleCategorySelection);
  }

  Widget buildAppBar(title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }

  void _handleCategorySelection(newCategoryId) {
    setState(() {
      categoryId = newCategoryId;
    });
  }
}
