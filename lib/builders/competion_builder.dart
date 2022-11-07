import 'package:match_day/builders/builder.dart';
import 'package:match_day/builders/category_builder.dart';
import 'package:match_day/models/competion.dart';
import 'package:pocketbase/pocketbase.dart';


class CompetionBuilder implements Builder {

final CategoryBuilder categoryBuilder = CategoryBuilder();
  @override
  List<Competion> decode(List<RecordModel> item) {
    return item.map((data) {
      Competion competion = Competion.fromJson(data);
      competion.categories = categoryBuilder.decodeFromExpand(data.expand);
      return competion;
    }).toList();
  }
}
