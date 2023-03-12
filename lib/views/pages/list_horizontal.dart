
import 'package:flutter/material.dart';

class ListHorizontal extends StatefulWidget {
  final List dataList;
  final Function(dynamic) onSelected;
  const ListHorizontal({super.key, required this.dataList, required this.onSelected});

  @override
  State<ListHorizontal> createState() => _ListHorizontalState();
}

class _ListHorizontalState extends State<ListHorizontal> {
  Object? data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: widget.dataList.map((doc) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChoiceChip(
                    selectedColor: const Color.fromRGBO(255, 204, 0, 1),
                    labelStyle: TextStyle(
                        color:
                            data == doc ? Colors.white : Colors.black),
                    label: Text(
                      doc.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    selected: data == doc,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          data = doc;
                         widget.onSelected(doc);
                        });
                      }
                    }),
              );
            }).toList(),
          ),
        );
  }
}