import 'package:flutter/widgets.dart';
import 'package:match_day/models/category.dart';

import 'category_item.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: ((context, index) {
        return CategoryItem(category: categories[index]);
      }));
  }
}