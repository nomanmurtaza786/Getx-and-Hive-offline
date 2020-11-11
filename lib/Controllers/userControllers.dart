import 'package:get/get.dart';
import 'package:github_Api/model/github_api_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserController extends GetxController {
  final users = List<GithubModel>().obs;

  var isLoading = false.obs;
  static const _url = 'https://api.github.com/users';

  Box box;

  @override
  void onInit() {
    super.onInit();
    userDataService();
  }

  Future<void> userDataService() async {
    

    isLoading(true);
    // if (isLoading.value) {
    //   LinearProgressIndicator();
    // }
    var response = await http.get(_url);
    //var res = json.decode(response.body); //json object
    var userresult = githubModelFromJson(response.body);

    users.value = userresult;
    isLoading(false);
    //Get.snackbar('Hi', 'i am a modern snackbar',titleText: Text("Yo Yo "), backgroundColor: Colors.green);
  }
}
