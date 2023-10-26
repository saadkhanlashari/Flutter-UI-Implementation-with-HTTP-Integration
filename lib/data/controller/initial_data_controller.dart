import 'package:get/get.dart';

import '../api/api_service.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ApiService>((ApiService()));
  }
}
