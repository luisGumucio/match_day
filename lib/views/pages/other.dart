

import 'package:flutter/material.dart';
import 'package:match_day/models/category.dart';
import 'package:match_day/services/category_service.dart';

class Other extends StatefulWidget {
  const Other({super.key});

  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> {
Category? dropdownvalue;
final CategoryService categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return 
            FutureBuilder<List<Category>>(
              future: categoryService.getAllCategory(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return DropdownButton(
                    value: dropdownvalue ?? data[0],

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: data.map((Category items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items.name),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (Category? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
    );
  }
}