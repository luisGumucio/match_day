import 'package:match_day/models/category.dart';
import 'package:match_day/utils/pocket_base_client.dart';
import 'package:pocketbase/pocketbase.dart';

class CategoryService {
  static const categoryIndex = 'category';

  Future<List<Category>> getAllCategory({int page = 1}) async {
    final result = await client.records
        .getList(categoryIndex, page: page, perPage: 20, sort: '-created');
    List<Category> catogories = _decodeCategory(result.items);
    return catogories;
  }

  Future<Category> addCategory(Category category) async {
    final body = category.toJson(category);
    final result = await client.records.create(categoryIndex, body: body);
    return Category.fromJson(result);
  }

  List<Category> _decodeCategory(List<RecordModel> items) {
    return items.map((item) {
      return Category.fromJson(item);
    }).toList();
  }

  addTeamToCategory(Category category) async {
    Category categoryUpdate = Category(
        id: category.id,
        name: category.name,
        teamTotal: category.teamTotal + 1);
    final body = category.toJson(categoryUpdate);
    await client.records.update(categoryIndex, category.id, body: body);
  }
}
