
import 'package:match_day/builders/competion_builder.dart';
import 'package:match_day/models/competion.dart';
import 'package:match_day/utils/pocket_base_client.dart';

class CompetionService {
  static const competionIndex = 'competions';
  final CompetionBuilder competionBuilder = CompetionBuilder();

  Future<List<Competion>> getAllCompetion({int page = 1}) async {
    final result = await client.collection(competionIndex).getList(
    page: page, perPage: 20, sort: '-created', expand: 'categories');

    List<Competion> competions = competionBuilder.decode(result.items);
    return competions;
  }

  Future<Competion> addCompetion(Competion competion) async {
    final body = competion.toJson(competion);
    final result = await client.collection(competionIndex).create(body: body);
    return Competion.fromJson(result);
  }
}
