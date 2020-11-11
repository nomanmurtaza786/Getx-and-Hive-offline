import 'package:get/get.dart';
import 'package:github_Api/model/bordingAppModel.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class BoringAppController extends GetxController {
  final boringActivity = List<BoringAppModel>().obs;
  var boaringModel = BoringAppModel().obs;
  final isLoading = false.obs;
  static const _url = 'https://www.boredapi.com/api/activity';
  Box box;

  @override
  void onInit() {
    super.onInit();
    activityDataService();
  }

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('data');
    return;
  }

  Future<void> activityDataService() async {
    isLoading(true);

    try {
      var response = await http.get(_url);

      //var res = response.body;
      //print(res);
      //var res = json.decode(response.body); //json object
      var activity = boringAppModelFromJson(response.body);

      boringActivity.clear();

      boringActivity.add(activity);

      isLoading(false);
      //Get.snackbar('Hi', 'i am a modern snackbar',titleText: Text("Yo Yo "), backgroundColor: Colors.green);
    } catch (SocketException) {
      print('No internet');
    }

    Future putdata(data) async {
      // insert the data
      await box.clear();
      box.add(data);
      

      // insert the data
    }
  }
}
