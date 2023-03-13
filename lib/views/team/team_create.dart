import 'dart:io';

import 'package:flutter/material.dart';
import 'package:match_day/services/category_service.dart';
import 'package:match_day/services/picture_service.dart';
import 'package:match_day/services/team_service.dart';
import 'package:match_day/views/pages/camera_page.dart';

import '../../models/category.dart';
import '../../models/team.dart';
import '../pages/team_select.dart';

class TeamCreate extends StatefulWidget {
  const TeamCreate({super.key});

  @override
  State<TeamCreate> createState() => _TeamCreateState();
}

class _TeamCreateState extends State<TeamCreate> {
  final CategoryService categoryService = CategoryService();
  final TeamService teamService = TeamService();
  final PictureService pictureService = PictureService();
  final _globalkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  late TeamSelect teamSelect;
  late Category _categorySelected;
  File? _photo;
  bool circular = false;
  bool userInteracts() => _photo != null;
  List<Category> categories = [];
  @override
  void initState() {
    super.initState();
    categoryService.getAllCategory().then((value) {
      setState(() {
        categories = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear Equipo'),
        ),
        body: Form(
          key: _globalkey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            children: [
              CameraPage(setPhoto: _setPhoto),
              const SizedBox(
                height: 20,
              ),
              _nameTextField(),
              const SizedBox(
                height: 20,
              ),
              _getCategory(),
              _saveTeamButton(context),
            ],
          ),
        ));
  }

  Widget _getCategory() {
    teamSelect = TeamSelect(categories: categories, setCategorySelected: setCategorySelected);

    return categories.isEmpty ? const CircularProgressIndicator() : teamSelect;
  }

  Widget _saveTeamButton(BuildContext context) {
    return InkWell(
      // !userInteracts() ||
      //         _globalkey.currentState == null ||
      //         !_globalkey.currentState!.validate()
      //     ? null
      //     :
      onTap: () {
        _saveTeam(context);
      },
      child: Center(
          child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: circular
              ? const CircularProgressIndicator()
              : const Text(
                  "Guardar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      )),
    );
  }

  Widget _nameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value!.isEmpty) return "El nombre no puede ser vacio!";

        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Nombre",
        helperText: "El nombre no puede ser vacio!",
        hintText: "Ninjas FC",
      ),
    );
  }

  _setPhoto(photo) {
    setState(() {
      _photo = photo;
    });
  }

  void _saveTeam(BuildContext context) {
    setState(() {
      circular = true;
    });

    if (_globalkey.currentState!.validate()) {
      _globalkey.currentState!.save();
      pictureService.addPicture(_photo!).then((value) async {
        Category category = _categorySelected;
        Team team = Team( 
          name: _name.text,
          urlLogo: value.url,
          id: "",
        );
        team.category = category;
        await teamService.addTeam(team);
        await categoryService.addTeamToCategory(category);
        setState(() {
          circular = false;
          Navigator.of(context).pop();
        });
      });
    } else {
      setState(() {
        circular = false;
      });
    }
  }

  setCategorySelected(Category category) {
    setState(() {
      _categorySelected = category;
    });
  }
}
