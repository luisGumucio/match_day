import 'package:flutter/material.dart';
import 'package:match_day/views/category/category_home.dart';
import 'package:match_day/views/product/product_home.dart';

import '../menu/menu_home.dart';
import 'standings/standings_home.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedItemIndex = 0;

  final List<Widget> _widgets = [
    const ProductHome(),
    const StandingsHome(),
    const CategoryHome(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text(widget.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600)),
          actions: <Widget>[
            IconButton(
                onPressed: _goToMenu,
                icon: const Icon(Icons.person, color: Colors.black))
          ],
        ),
        body: Center(
          child: _widgets[selectedItemIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.store), label: 'Productos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.scoreboard), label: 'Tabla'),
            BottomNavigationBarItem(
                icon: Icon(Icons.ballot_sharp), label: 'Historial'),
          ],
          currentIndex: selectedItemIndex,
          onTap: (int index) {
            setState(() {
              selectedItemIndex = index;
            });
          },
        ));
  }

  _goToMenu() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const MenuHome();
    }));
  }
}
