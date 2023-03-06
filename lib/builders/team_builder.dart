
import 'package:match_day/models/category.dart';
import 'package:match_day/models/team.dart';
import 'package:pocketbase/pocketbase.dart';
import 'builder.dart';

class TeamBuilder implements Builder {
  
  @override
  List<Team> decode(List<RecordModel> item) {
    return item.map((data) {
      Team team = Team.fromJson(data);
      for (var element in data.expand['categoryId']!) {
        team.category = Category.fromJsonExpand(element.id, element.data);
      }
      return team;
    }).toList();
  }

  
}