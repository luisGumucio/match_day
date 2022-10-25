import 'package:flutter/material.dart';
import 'package:match_day/models/category.dart';
import 'package:match_day/services/category_service.dart';


class CategoryCreate extends StatefulWidget {
  final Function refresh;
  const CategoryCreate({Key? key, required this.refresh}) : super(key: key);

  @override
  State<CategoryCreate> createState() => _CategoryCreateState();
}

class _CategoryCreateState extends State<CategoryCreate> {
  final _createCategoryKey = GlobalKey<FormState>();
  final CategoryService categoryService = CategoryService();

  late String name;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Categoria')),
      body: SingleChildScrollView(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _createCategoryKey,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(children: <Widget>[
                    const Padding(padding: EdgeInsets.all(10.0)),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Enter Name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(labelText: 'Nombre'),
                        onSaved: (input) => name = input!,
                      ),
                    ),
                    ButtonTheme(
                      height: 40.0,
                      minWidth: 200.0,
                      child: ElevatedButton(
                        onPressed: _saveCategory,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: const Text(
                          'Guardar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                    )
                  ]),
                ),
              ),
      ),
    );
  }

  _saveCategory() async {
    if (_createCategoryKey.currentState!.validate()) {
      _createCategoryKey.currentState!.save();
      Category category = Category(id: "", name: name, teamTotal: 0);
      setState(() {
        isLoading = true;
      });
      final navigator = Navigator.of(context);
      await categoryService.addCategory(category);
      widget.refresh();
      setState(() {
        isLoading = false;
      });
      navigator.pop();
    }
  }
}
