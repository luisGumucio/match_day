import 'package:pocketbase/pocketbase.dart';

import 'category.dart';

class Competion {
  final String name;
  final DateTime initDate;
  final DateTime endDate;
  late List<Category> categories;
  final bool isStarted;

  Competion(
      this.name, this.initDate, this.endDate, this.isStarted);

  factory Competion.fromJson(RecordModel item) {
    return Competion(
        item.data['name'],
        DateTime.parse(item.data['initDate']),
        DateTime.parse(item.data['endDate']),
        item.data['isStarted']);
  }

  Map<String, dynamic> toJson(Competion competion) {
    return <String, dynamic> {
      'name': competion.name,
      'initDate': competion.initDate.toString(),
      'endDate': competion.endDate.toString(),
      'isStarted': competion.isStarted,
      'categories': competion.categories.map((e) { return e.id;}).toList()
    };
  }
}
