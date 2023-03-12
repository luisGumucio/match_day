import 'package:match_day/builders/builder.dart';
import 'package:pocketbase/src/dtos/record_model.dart';

import '../models/fixture.dart';


class FixtureBuilder implements Builder {
  @override
  List<Fixture> decode(List<RecordModel> item) {
    return item.map((data) {
      Fixture fixture = Fixture.fromJson(data);
      return fixture;
     }).toList();
  }

}