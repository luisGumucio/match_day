import 'package:match_day/builders/team_builder.dart';
import 'package:match_day/models/team.dart';
import 'package:match_day/utils/pocket_base_client.dart';

class TeamService {
  static const teamIndex = 'teams';
  final TeamBuilder teamBuilder = TeamBuilder();

  Future<List<Team>> getAllTeam({int page = 1}) async {
    final result = await client.collection(teamIndex).getList(
        page: page, perPage: 20, sort: '-created', expand: 'categoryId');

    var teams = teamBuilder.decode(result.items);

    return teams;
  }

  Future<Team> addTeam(Team team) async {
    final body = team.toJson(team);
    final result = await client.collection(teamIndex).create(body: body);

    return Team.fromJson(result);
  }

  Future<List<Team>> getAllTeamByCategoryId(String categoryId, {int page = 1}) async {
    final result = await client.collection(teamIndex).getList(page: page, perPage: 20, filter: 'categoryId = "$categoryId"', expand: 'categoryId');
    var teams = teamBuilder.decode(result.items);
    return teams;
  }
}
