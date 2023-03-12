
import 'package:flutter/material.dart';
import 'package:match_day/models/competion.dart';
import 'package:match_day/views/pages/list_horizontal.dart';

import '../../services/competion_service.dart';

class CompetitionListHorizontal extends StatefulWidget {
  final Function(dynamic) onCompetionSelected;
  const CompetitionListHorizontal({super.key, required this.onCompetionSelected});

  @override
  State<CompetitionListHorizontal> createState() => _CompetitionListHorizontalState();
}

class _CompetitionListHorizontalState extends State<CompetitionListHorizontal> {
  final CompetionService _competionService = CompetionService();
  Competion compention = Competion('', '', DateTime.now(), DateTime.now(), false);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Competion>>(
      future: _competionService.getAllCompetionActive(),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();
        return ListHorizontal(dataList: snapshot.data!, onSelected: widget.onCompetionSelected);
        // return SizedBox(
        //   height: 50,
        //   child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     physics: const BouncingScrollPhysics(),
        //     children: snapshot.data!.map((doc) {
        //       return Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: ChoiceChip(
        //             selectedColor: const Color.fromRGBO(255, 204, 0, 1),
        //             labelStyle: TextStyle(
        //                 color:
        //                     compention == doc ? Colors.white : Colors.black),
        //             label: Text(
        //               doc.name,
        //               style: const TextStyle(fontWeight: FontWeight.bold),
        //             ),
        //             selected: compention == doc,
        //             onSelected: (selected) {
        //               if (selected) {
        //                 setState(() {
        //                   compention = doc;
        //                  widget.onCompetionSelected(doc);
        //                 });
        //               }
        //             }),
        //       );
        //     }).toList(),
        //   ),
        // );
      }),
    );
  }
}