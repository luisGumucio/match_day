
import 'package:match_day/models/category.dart';
import 'package:pocketbase/pocketbase.dart';

class Team {
  late String id;
  final String name;
  final String urlLogo;
  late Category category;

  Team(this.id, { required this.name,
   required this.urlLogo});

  factory Team.fromJson(RecordModel item) {
    return Team(item.id, name: item.data['name'],
     urlLogo: item.data['urlLogo']);
  }

  Map<String, dynamic> toJson(Team team) {
    return <String, dynamic> {
      'name': team.name,
      'urlLogo': team.urlLogo,
      'categoryId': team.category.id
    };
  }
}