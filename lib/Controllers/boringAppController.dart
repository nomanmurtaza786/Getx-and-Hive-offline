import 'package:get/get.dart';
import 'package:github_Api/model/bordingAppModel.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';

import 'package:github_Api/Global/Gobal.dart';

class BoringAppController extends GetxController {
  final boringActivity = List<BoringAppModel>().obs;
  var boaringModel = BoringAppModel().obs;
  final isLoading = false.obs;
  static const _url = 'https://www.boredapi.com/api/activity';
  final bool dataReloading = true;

  @override
  Future<void> onInit() async {
    super.onInit();

    activityDataService();
  }

  Future<void> activityDataService() async {
    if (box.isNotEmpty) {
      print("Loading from cache");
      print(box.isNotEmpty);
      var jsonData = box.get('BoringData');
      BoringAppModel activity = boringAppModelFromJson(jsonData);
      boringActivity.add(activity);
      isLoading(false);
    } else {
      try {
        print("Loading from API");

        var response = await http.get(_url);

        var activity = boringAppModelFromJson(response.body);
        boringActivity.clear();
        //of you are gettting list of Json Data then use boringActivity.value = parsed Data;
        
        boringActivity.add(activity);
        box.put('BoringData', response.body);

        isLoading(false);
      } catch (e) {
        print(e);
      }
    }
  }

  Future dataReload() async {
    await box.clear();
    return activityDataService();
  }
}
