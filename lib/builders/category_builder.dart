import 'package:match_day/builders/builder.dart';
import 'package:pocketbase/src/dtos/record_model.dart';

import '../models/category.dart';

class CategoryBuilder implements Builder {
  @override
  List<Category> decode(List<RecordModel> item) {
    // TODO: implement decode
    throw UnimplementedError();
  }

  List<Category> decodeFromExpand(Map<String, dynamic> item) {
    List categories = item['categories'];
    List<Category> categorias = categories.map((data) {
      try {
        return Category.fromJsonExpand(data);
      } catch (ex) {
        print(ex);
        throw ex;
      }
    }).toList();
    return categorias;
  }
}
