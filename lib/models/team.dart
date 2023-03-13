
import 'package:match_day/models/category.dart';
import 'package:pocketbase/pocketbase.dart';

class Team {
  String? id;
  final String name;
  final String urlLogo;
  late Category category;

  Team({ this.id, required this.name,
   required this.urlLogo});

  factory Team.fromJson(RecordModel item) {
    return Team(name: item.data['name'],
     urlLogo: item.data['urlLogo'], id: item.id);
  }

  factory Team.fromJsonExpand(List<RecordModel> items) {
    return Team(name: "name", urlLogo: "urlLogo", id: "item.id");
  }

  Map<String, dynamic> toJson(Team team) {
    return <String, dynamic> {
      'name': team.name,
      'urlLogo': team.urlLogo,
      'categoryId': team.category.id
    };
  }
}