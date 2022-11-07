import 'package:flutter/material.dart';

import '../models/menu_item_setting.dart';
import '../views/category/category_home.dart';
import '../views/competion/competion_home.dart';
import '../views/team/team_home.dart';
import 'pages/menu_item_card.dart';

// import 'package:match_day/models/menu_item_setting.dart';
// import 'package:match_day/views/category/categoy_home.dart';
// import 'package:match_day/views/score/score_home.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({Key? key}) : super(key: key);

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  final List<MenuItemCard> menuItemCards = [
    MenuItemCard(
        menuItemSetting: MenuItemSetting(Icons.sports_golf_sharp, 'Torneos',
            'Crear torneos', Colors.green, const CompetionHome())),
    MenuItemCard(
        menuItemSetting: MenuItemSetting(
            Icons.category,
            'Categorias',
            'Crear categorias para equipos',
            Colors.purple,
            const CategoryHome())),
    MenuItemCard(
        menuItemSetting: MenuItemSetting(Icons.sports_soccer, 'Equipos',
            'Crear equipos de futbol', Colors.blue, const TeamHome())),
    // MenuItemCard(menuItemSetting: MenuItemSetting(Icons.sports_score, 'Score',
    // 'Registra los scores por equipo', Colors.green, const ScoreHome()))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const BackButton(
              color: Colors.black, // <-- SEE HERE
            ),
            title: const Text(
              "Menu",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            backgroundColor: Colors.white),
        body: ListView(
          children: menuItemCards,
        ));
  }
}
