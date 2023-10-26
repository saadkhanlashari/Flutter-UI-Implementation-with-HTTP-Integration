import 'dart:convert';

import 'package:flutter_ui_implementation_with_http_integration/data/model/image_model.dart';
import 'package:flutter_ui_implementation_with_http_integration/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
//  as devtools show log;

// extension Log on Object {
//   void log() => devtools.log(toString());
// }

class ApiService extends GetxController {
  List<Images> futureAlbum = <Images>[];
  int selectedItemIndex = 0;
  void setSelectedItemIndex(int index) {
    selectedItemIndex = index;
    update();
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(AppConstants.basenUrl));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final result = jsonDecode(response.body);
      futureAlbum =
          List<Images>.from(result['data'].map((x) => Images.fromJson(x)));
      update();
      log(futureAlbum.first.icon.toString());
    } else if (response.statusCode == 404) {
    } else if (response.statusCode == 401) {
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
