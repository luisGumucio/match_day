import 'package:flutter/material.dart';
import 'package:match_day/models/category.dart';

class TeamSelect extends StatefulWidget {
  final List<Category> categories;
  final Function setCategorySelected;
  
  const TeamSelect({super.key, required this.categories, required this.setCategorySelected});

  @override
  State<TeamSelect> createState() => _TeamSelectState();

}

class _TeamSelectState extends State<TeamSelect> {
  
  late Category category = widget.categories.first;
  
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Category>(
        value: category,
        hint: const Text('categorias'),
        items: widget.categories
            .map<DropdownMenuItem<Category>>((Category category) {
          return DropdownMenuItem<Category>(
              value: category, child: Text(category.name));
        }).toList(),
        onChanged: (value) {
          setState(() {
            category = value!;
            widget.setCategorySelected(category);
          });
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
            width: 2,
          )),
          prefixIcon: Icon(
            Icons.category,
            color: Colors.green,
          ),
          helperText: "La categoria no puede ser vacio!",
        ));
  }
}
