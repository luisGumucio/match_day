import 'package:match_day/models/standings.dart';
import 'package:match_day/utils/pocket_base_client.dart';
import 'package:pocketbase/pocketbase.dart';

class StandingsService {

  static const standingsIndex = 'standings';

  Future<List<Standings>> getStadingsByCategory(String categoryId) async {
    final result = await client.collection(standingsIndex).getList(filter: 'categoryId = "$categoryId"');
    List<Standings> standings = _decodeStandings(result.items);
    return standings;
  }

  List<Standings> _decodeStandings(List<RecordModel> items) {
    return items.map((item) {
      return Standings.fromJson(item);
    }).toList();
  }

}