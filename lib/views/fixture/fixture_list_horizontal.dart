import 'package:flutter/material.dart';
import 'package:match_day/models/fixture.dart';

class FixtureListHorizontal extends StatefulWidget {
  final Function(dynamic) onSelected;
  final List<Fixture> fixtures;
  const FixtureListHorizontal(
      {super.key,
      required this.fixtures,
      required this.onSelected});

  @override
  State<FixtureListHorizontal> createState() => _FixtureListHorizontalState();
}

class _FixtureListHorizontalState extends State<FixtureListHorizontal> {
  Fixture? _fixture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: widget.fixtures.map((doc) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChoiceChip(
                    selectedColor: const Color.fromRGBO(255, 204, 0, 1),
                    labelStyle: TextStyle(
                        color: _fixture == doc ? Colors.white : Colors.black),
                    label: Text(
                      doc.nroRecord.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    selected: _fixture == doc,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _fixture = doc;
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
