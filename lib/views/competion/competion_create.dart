import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:match_day/models/competion.dart';
import 'package:match_day/services/competion_service.dart';

import '../../constant/choice_constant.dart';
import '../../models/category.dart';
import '../../models/choice.dart';
import '../../services/category_service.dart';
import '../pages/team_select.dart';

class CompetionCreate extends StatefulWidget {
  const CompetionCreate({super.key});

  @override
  State<CompetionCreate> createState() => _CompetionCreateState();
}

class _CompetionCreateState extends State<CompetionCreate> {
  int currentStep = 0;
  final name = TextEditingController();
  final initDate = TextEditingController();
  final endDate = TextEditingController();
  final CategoryService categoryService = CategoryService();
  final CompetionService _competionService = CompetionService();
  Category? _categorySelected;

  List<Category> categories = [];
  List<Category> categoriesSelected = [];
  Color color = Colors.white;
  Choice? selectedCard;

  @override
  void initState() {
    super.initState();
    categoryService.getAllCategory().then((value) {
      setState(() {
        categories = value;
        _categorySelected = categories.first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Competicion")),
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.red)),
        child: Stepper(
          type: StepperType.horizontal,
          steps: _getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == _getSteps().length - 1;

            if (isLastStep) {
              Competion competion = Competion(
                  name.value.text,
                  DateFormat("MMM d, yyyy").parse(initDate.text),
                  DateFormat("MMM d, yyyy").parse(endDate.value.text),
                  false);
              competion.categories = categoriesSelected;
              _competionService
                  .addCompetion(competion)
                  .then((value) => {Navigator.of(context).pop(competion)});
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepTapped: (step) => setState(() => currentStep = step),
          onStepCancel: currentStep == 0
              ? null
              : () => {
                    setState(() {
                      currentStep -= 1;
                    })
                  },
          controlsBuilder: (context, detail) {
            final isLastStep = currentStep == _getSteps().length - 1;
            return Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: detail.onStepContinue,
                    child: Text(isLastStep ? 'Confirmar' : 'Siguiente'),
                  )),
                  const SizedBox(width: 12),
                  if (currentStep != 0)
                    Expanded(
                        child: ElevatedButton(
                      onPressed: detail.onStepCancel,
                      child: const Text('Atras'),
                    )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getFormInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Configuracion de tu competicion',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const Text('Ingrese los datos.',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
        Container(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(labelText: "Nombre"),
              ),
              TextFormField(
                controller: initDate,
                decoration: const InputDecoration(
                  labelText: "Fecha de inicio",
                ),
                onTap: () async {
                  DateTime? date = DateTime.now();
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  initDate.text = DateFormat('MMM d, yyyy').format(date!);
                },
              ),
              TextFormField(
                controller: endDate,
                decoration: const InputDecoration(
                  labelText: "Fecha de fin",
                ),
                onTap: () async {
                  DateTime? date = DateTime.now();
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  endDate.text = DateFormat('MMM d, yyyy').format(date!);
                },
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _getFormCategory() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Agrege las categorias',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _getCategory(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      categoriesSelected.clear();
                    });
                  },
                  child: const Text("limpiar")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_categorySelected != null) {
                        categoriesSelected.add(_categorySelected!);
                      }
                    });
                  },
                  child: const Text("Agregar"))
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: categoriesSelected.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                margin: const EdgeInsets.all(2),
                color: Colors.blue[400],
                child: Center(
                    child: Text(
                  categoriesSelected[index].name,
                  style: const TextStyle(fontSize: 18),
                )),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _getCategory() {
    return categories.isEmpty
        ? const CircularProgressIndicator()
        : TeamSelect(
            categories: categories, setCategorySelected: setCategorySelected);
  }

  setCategorySelected(Category category) {
    setState(() {
      _categorySelected = category;
    });
  }

  Widget _getFormSports() {
    return Column(
      children: <Widget>[
        GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(choices.length, (index) {
              var choice = choices[index];
              return Center(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = choice;
                        });
                      },
                      child: Card(
                        color: selectedCard == choice
                            ? Colors.yellow
                            : Colors.white,
                        child: Center(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Icon(choice.icon,
                                        size: 90.0, color: Colors.black)),
                                Text(choice.title,
                                    style:
                                        const TextStyle(color: Colors.black)),
                              ]),
                        ),
                      )));
            }))
      ],
    );
  }

  List<Step> _getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            title: const Text('1'),
            content: _getFormSports(),
            isActive: currentStep >= 0),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            title: const Text('2'),
            content: _getFormInformation(),
            isActive: currentStep >= 1),
        Step(
            title: const Text('3'),
            content: _getFormCategory(),
            isActive: currentStep >= 2)
      ];
}
