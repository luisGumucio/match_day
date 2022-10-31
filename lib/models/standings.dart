import 'package:pocketbase/pocketbase.dart';

class Standings {
  final String id;
  final String teamId;
  final int playedGames;
  final int won;
  final int draw;
  final int lost;
  final int points;
  final String name;
  final String urlLogo;
  final String categoryId;

  factory Standings.fromJson(RecordModel item) {
    return Standings(item.id, item.data['teamId'],
    item.data['playedGames'],
    item.data['won'],
    item.data['draw'],
    item.data['lost'],
    item.data['points'],
    item.data['name'],
    item.data['urlLogo'],
    item.data['categoryId']);
  }

  Standings(this.id, this.teamId, this.playedGames,
   this.won, this.draw, this.lost, this.points, this.name, this.urlLogo, this.categoryId);
}