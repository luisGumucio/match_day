import 'package:flutter/material.dart';
import 'package:match_day/models/team.dart';

class TeamItem extends StatefulWidget {
  final Team team;
  const TeamItem({super.key, required this.team});

  @override
  State<TeamItem> createState() => _TeamItemState();
}

class _TeamItemState extends State<TeamItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Container(
        height: 100,
        color: Colors.white,
        child: ListTile(
            title: Text(widget.team.name),
            subtitle: Text(widget.team.category.name),
            leading: CircleAvatar(backgroundImage: NetworkImage(widget.team.urlLogo), backgroundColor: Colors.transparent,)),
      ),
    );
  }
}