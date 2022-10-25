import 'package:flutter/material.dart';
import 'package:match_day/models/category.dart';
import 'package:match_day/services/category_service.dart';

import 'category_list.dart';

class CategoryHome extends StatefulWidget {
  const CategoryHome({super.key});

  @override
  State<CategoryHome> createState() => _CategoryHomeState();
}

class _CategoryHomeState extends State<CategoryHome> {
  final CategoryService categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categorias")),
      body: FutureBuilder<List<Category>>(
        future: categoryService.getAllCategory(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CategoryList(categories: snapshot.data!)
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
