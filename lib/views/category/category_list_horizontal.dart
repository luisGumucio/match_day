import 'package:flutter/material.dart';

import '../../models/category.dart';

class CategoryListHorizontal extends StatefulWidget {
  final Function(String) onCategorySelected;
  final List<Category> categories;
  const CategoryListHorizontal({super.key, required this.onCategorySelected,
  required this.categories});

  @override
  State<CategoryListHorizontal> createState() => _CategoryListHorizontalState();
}

class _CategoryListHorizontalState extends State<CategoryListHorizontal> {  
  String categoryId = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: widget.categories.map((doc) {
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
  }
}
