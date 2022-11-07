import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constant/grid_layout_constant.dart';
import '../../models/competion.dart';
import '../pages/grid_option.dart';

class CompetionDetail extends StatefulWidget {
  final Competion competion;
  const CompetionDetail({super.key, required this.competion});

  @override
  State<CompetionDetail> createState() => _CompetionDetailState();
}

class _CompetionDetailState extends State<CompetionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.competion.name)),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: widget.competion.isStarted
                ? null
                : () {
                    print('PUBLICANDO');
                  },
            child: Text(widget.competion.isStarted ? 'Publicado' : 'Publicar'),
          ),
          Expanded(
            child: GridView.extent(
              shrinkWrap: true,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              padding: EdgeInsets.all(10.0),
              maxCrossAxisExtent: 200,
              children: List.generate(
                options.length,
                (index) => GridOptions(
                  layout: options[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
