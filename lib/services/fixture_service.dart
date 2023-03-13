import 'package:match_day/models/fixture.dart';
import 'package:match_day/utils/pocket_base_client.dart';

import '../builders/fixture_builder.dart';

class FixtureService {
  static const fixtureIndex = 'fixtures';
  final FixtureBuilder fixtureBuilder = FixtureBuilder();

  Future<List<Fixture>> getAllFixture(String categoryId,
  String competitionId, {int page = 1}) async {
    final result = await client.collection(fixtureIndex)
    .getList(page: page, perPage: 20, sort: '-created', 
    filter: 'categoryId = "$categoryId" && competitionId = "$competitionId"', 
    expand: "matches(fixture).teamLocal,matches(fixture).teamAway");
    var fixture = fixtureBuilder.decode(result.items);
    return fixture;
  }

}