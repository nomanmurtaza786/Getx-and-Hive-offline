import 'package:get/get.dart';
import 'package:github_Api/model/bordingAppModel.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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

  Future putdataInHive(data) async {
    // insert the data
    await box.clear();
    box.add(data);
    // insert the data
  }

  Future openBox() async {
    box = await Hive.openBox('data');
    return;
  }

  Future<void> activityDataService() async {
    isLoading(true);
    String fileName = "CacheData";
    var cacheDir = await getTemporaryDirectory();

    if (await File(cacheDir.path + "/" + fileName).exists()) {
      var jsonData = File(cacheDir.path + "/" + fileName).readAsStringSync();
      BoringAppModel activity = boringAppModelFromJson(jsonData);
      boringActivity.add(activity);
      isLoading(false);
    } else {
      try {
        var response = await http.get(_url);
        //var res = response.body;
        //print(res);
        //var res = json.decode(response.body); //json object
        var activity = boringAppModelFromJson(response.body);

        boringActivity.add(activity);

        isLoading(false);

        var tempDir = await getTemporaryDirectory();
        File file = new File(tempDir.path + "/" + fileName);
        file.writeAsString(response.body, flush: true, mode: FileMode.write);

        //Get.snackbar('Hi', 'i am a modern snackbar',titleText: Text("Yo Yo "), backgroundColor: Colors.green);
      } catch (e) {
        print('No internet');
      }
    }

//get the data from database

    //boringActivity.add(dataFromDatabase);
  }
}
