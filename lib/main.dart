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
import 'package:path_provider/path_provider.dart';
import 'Services/db/hivedbService.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  Get.lazyPut(() => BoringAppController());

  //Get.put(BoringAppController());
  //Get.put(UserController());
  //Box box;
  return runApp(GetMaterialApp(home: Home()));
}

Future<void> initServices() async {
  print('starting services ...');

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await Get.putAsync(() => HiveDbService().init());

  print('All services started...');
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
