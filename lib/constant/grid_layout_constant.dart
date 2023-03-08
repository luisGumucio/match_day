import 'package:flutter/material.dart';

import '../models/grid_layout.dart';
import '../views/competion/competion_detail_menu/detail_category_team.dart';
import '../views/standings/standings_home.dart';

List<GridLayout> options = [
  GridLayout(title: 'Equipos', icon: Icons.shield, page: const DetailCategoryTeam(title:'Equipos')),
  GridLayout(title: 'Tabla', icon: Icons.table_chart_outlined, page: const StandingsHome()),
  GridLayout(title: 'Sanciones', icon: Icons.disabled_visible_outlined, page: const DetailCategoryTeam(title:'Sanciones')),
  GridLayout(title: 'Score', icon: Icons.calendar_month, page: const DetailCategoryTeam(title:'Score')),
];