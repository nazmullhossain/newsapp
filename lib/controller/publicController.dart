import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

import 'api_serverice.dart';

class Publiccontroller extends GetxController {
  static Publiccontroller pc = Get.find();
  RxDouble size = 0.0.obs;
  List<dynamic> topStories = [].obs;
  RxInt kids=0.obs;

  Rx<String> data = "Fetching data...".obs;
  Rx<bool> isLoading = true.obs;

  var itemData = <String, dynamic?>{}.obs;
  ApiServerice apiServerice = ApiServerice();
  Future<void> initApp(BuildContext context) async {
    if (MediaQuery.of(context).size.width <= 500) {
      size.value = MediaQuery.of(context).size.width;
    } else {
      size(MediaQuery.of(context).size.height);
    }
    update();
    if (kDebugMode) {
      print('Initialized\n Size: ${size.value}');
    }
  }

  Future<void> getAllNews() async {
    await apiServerice.fetchTopStories();
    update();
  }


}
