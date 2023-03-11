import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:match_day/models/picture.dart';
import 'package:match_day/utils/pocket_base_client.dart';
import 'package:path/path.dart';

import '../utils/config.dart';

class PictureService {
  static const pictureIndex = 'pictures';

  Future<Picture> addPicture(File file) async {
    final fileName = basename(file.path);
    final result = await client.collection(pictureIndex).create(files: [
      http.MultipartFile.fromBytes(
        'image', // the name of the file field
        file.readAsBytesSync(),
        filename: fileName,
      ),
    ]);
    String url = '${Config.uri}/api/files/${result.collectionId}/${result.id}/${result.data['image']}';
    return Picture(url: url);
  }
}
