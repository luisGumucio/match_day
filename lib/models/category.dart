import 'package:pocketbase/pocketbase.dart';

class Category {
  final String id;
  final String name;
  final int teamTotal;
  Category({required this.id, required this.name, required this.teamTotal});

  factory Category.fromJson(RecordModel item) {
    return Category(id: item.id, name: item.data['name'], teamTotal: item.data['teamTotal']);
  }

  Map<String, dynamic> toJson(Category category) {
    return <String, dynamic> {
      'name': category.name,
      'teamTotal': category.teamTotal
    };
  }

  factory Category.fromJsonExpand(Map<String, dynamic> expand) {
    return Category(id: expand['id'], name: expand['name'], teamTotal: expand['teamTotal']);
  }
}
