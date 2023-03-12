import 'package:match_day/models/competion.dart';
import 'package:pocketbase/pocketbase.dart';

import 'category.dart';

class Fixture {
  String? id;
  final String place;
  final DateTime date;
  final String scoreId;
  Category? category;
  Competion? competion;

  Fixture({this.id, required this.place, required this.date, required this.scoreId,
  this.category, this.competion});

  factory Fixture.fromJson(RecordModel item) {
    return Fixture(place: item.data['place'], date: DateTime.parse(item.data['date']), scoreId: '', id:item.id);
    //  Fixture(place: item.data['place'], date: DateTime.parse(item.data['date']), scoreId: '')
  }

}