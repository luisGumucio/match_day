import 'team.dart';

class SoccerMatch {
  final Team teamLocal;
  final Team teamAway;
  final int scoreLocal;
  final int scoreAway;
  final String categoryId;
  final String compentionId;

  SoccerMatch({required this.teamLocal, required this.teamAway,
  required this.scoreLocal, required this.scoreAway, required this.categoryId,
   required this.compentionId});
   
}