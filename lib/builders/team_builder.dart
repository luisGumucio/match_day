
import 'package:match_day/models/category.dart';
import 'package:match_day/models/team.dart';
import 'package:pocketbase/pocketbase.dart';
import 'builder.dart';

class TeamBuilder implements Builder {
  
  @override
  List<Team> decode(List<RecordModel> item) {
    return item.map((data) {
      Team team = Team.fromJson(data);
      team.category = Category.fromJsonExpand(data.expand['categoryId']);
      return team;
    }).toList();
  }

  
}