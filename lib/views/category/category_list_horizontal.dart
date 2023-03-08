import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../services/category_service.dart';

class CategoryListHorizontal extends StatefulWidget {
  final Function(String) onCategorySelected;
  const CategoryListHorizontal({super.key, required this.onCategorySelected});

  @override
  State<CategoryListHorizontal> createState() => _CategoryListHorizontalState();
}

class _CategoryListHorizontalState extends State<CategoryListHorizontal> {
  final CategoryService _categoryService = CategoryService();
  String categoryId = "";

  @override
  Widget build(BuildContext context) {
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
                      if (selected) {
                        setState(() {
                          categoryId = doc.id;
                         widget.onCategorySelected(doc.id);
                        });
                         
                      }
                    }),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
