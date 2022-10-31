import 'package:flutter/material.dart';

import '../../models/standings.dart';
import '../../services/standings_service.dart';


class TableScreen extends StatefulWidget {
  final String categoryId;
  const TableScreen({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  late List _table = [];
  final StandingsService standingsService = StandingsService();

  @override
  Widget build(BuildContext context) {
    return widget.categoryId == ""
        ? const Center(child: Text("No hay equipos!"))
        : _loadTable();
  }

  _loadTable() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.white,
          Colors.white,
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(0.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      )),
      child: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Club',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'PL',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'W',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'D',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'L',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pts',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder<List<Standings>?>(
            future: standingsService.getStadingsByCategory(widget.categoryId),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("No hay equipos!"),
                );
              }
              return buildTable1(snapshot);
            }),
          )
        ],
      ),
    );
  }

  Widget buildTable1(AsyncSnapshot<List<Standings>?> snapshot) {
    List<Widget> teams = [];
    if (snapshot.data!.isEmpty) {
      return const Center(
        child: Text("No hay equipos!"),
      );
    }
    for (var data in snapshot.data!) {
      teams.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(data.urlLogo),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: 10),
                        Text(data.name),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.playedGames.toString()),
                    Text(data.won.toString()),
                    Text(data.draw.toString()),
                    Text(data.lost.toString()),
                    Text(data.points.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Column(
      children: teams,
    );
  }
}
