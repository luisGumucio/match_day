import 'package:match_day/models/team.dart';
import 'package:pocketbase/pocketbase.dart';

class Match {
  Team? teamLocal;
  Team? teamAway;

  Match({this.teamLocal, this.teamAway});
  
  factory Match.fromJson(){
    return Match();
  }
  static List<Match> getMatches(List<RecordModel>? expand) {
    List<Match>  matches = [];
    return matches;
  }
}