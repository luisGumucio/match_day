import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:match_day/views/competion/competion_detail.dart';
import '../../models/competion.dart';

class CompetionItem extends StatelessWidget {
  final Competion competion;
  const CompetionItem({super.key, required this.competion});

  @override
  Widget build(BuildContext context) {
    var initDate = DateFormat('MMM d, yyyy').format(competion.initDate);
    var endDate = DateFormat('MMM d, yyyy').format(competion.endDate);
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Container(
          height: 100,
          color: Colors.white,
          child: ListTile(
            title: Text(competion.name),
            subtitle: Text('${initDate} - ${endDate}'),
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text(competion.name[0].toUpperCase()),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CompetionDetail(competion: competion)),
                );
              },
            ),
          )),
    );
  }
}
