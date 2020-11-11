import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:github_Api/HomeBoringApp.dart';
import 'package:github_Api/HomePage0bx.dart';

import 'HomePage.dart';
import 'HomeGetx.dart';
import 'Controllers/userControllers.dart';
import 'Controllers/boringAppController.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Get.lazyPut(() => BoringAppController());
  //Get.put(BoringAppController());
  Get.put(UserController());
  //Box box;

  return runApp(GetMaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Github App',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: HomeBoringApp(),
      ),
    );
  }
}
