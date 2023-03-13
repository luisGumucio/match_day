import 'package:match_day/models/competion.dart';
import 'package:match_day/models/match.dart';

import 'package:pocketbase/pocketbase.dart';

import 'category.dart';

class Fixture {
  String? id;
  final int nroRecord;
  final DateTime date;
  List<Match>? matches;
  Category? category;
  Competion? competion;

  Fixture({this.id,
  required this.nroRecord,
  required this.date,
  this.matches,
  this.category, this.competion});

  factory Fixture.fromJson(RecordModel item) {
    return Fixture(
    nroRecord: int.parse(item.data['nroRecord']),
    date: DateTime.parse(item.data['date']),
    matches: Match.getMatches(item.expand['matches(fixture)']),
    id:item.id);
  }

}