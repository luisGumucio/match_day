import 'package:pocketbase/pocketbase.dart';

import 'category.dart';

class Competion {
  String? id;
  final String name;
  final DateTime initDate;
  final DateTime endDate;
  late List<Category> categories;
  final bool isStarted;

  Competion(this.id,
      this.name, this.initDate, this.endDate, this.isStarted);

  factory Competion.fromJson(RecordModel item) {
    return Competion(
        item.id,
        item.data['name'],
        DateTime.parse(item.data['initDate']),
        DateTime.parse(item.data['endDate']),
        item.data['isStarted']);
  }

  Map<String, dynamic> toJson(Competion competion) {
    return <String, dynamic> {
      'id': competion.id,
      'name': competion.name,
      'initDate': competion.initDate.toString(),
      'endDate': competion.endDate.toString(),
      'isStarted': competion.isStarted,
      'categories': competion.categories.map((e) { return e.id;}).toList()
    };
  }

  bool equals(Object other) {
    if (other is! Competion) return false; // Si el objeto no es una persona, no es igual.
    return other.name == name; // Compara el nombre y la edad.
  }
}
