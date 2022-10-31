import 'package:pocketbase/pocketbase.dart';

abstract class Builder {

  List<Object> decode(List<RecordModel> item);
}