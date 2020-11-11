import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_Api/Controllers/boringAppController.dart';
import 'package:github_Api/Controllers/userControllers.dart';
//import 'package:github_Api/Controllers/userControllers.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeBoringApp extends StatelessWidget {
  //final userController = Get.put(UserController());
  final BoringAppController boringController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BorningApp'),
      ),
      body: Obx(
        () => boringController.isLoading.value
            ? SingleChildScrollView(
                child: Column(
                  children: [LinearProgressIndicator(), VxZeroList()],
                ),
              )
            : BoringListView(boringController: boringController),
      ),
    );
  }
}

class BoringListView extends StatelessWidget {
  const BoringListView({
    Key key,
    @required this.boringController,
  }) : super(key: key);

  final BoringAppController boringController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      //strokeWidth: 5.0,
      //semanticsLabel: 'Fetch Data',
      onRefresh: boringController.activityDataService,
      child: ListView.builder(
        //cacheExtent: 2.0,
        //addAutomaticKeepAlives: true,
        //reverse: true,
        itemCount: boringController.boringActivity.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  //dense: true,
                  enabled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onTap: () {},
                  isThreeLine: true,
                  leading: Icon(Icons.person),
                  title: Obx(() => Text(
                        boringController.boringActivity[index].activity,
                        style: TextStyle(fontSize: 20),
                      )),
                  subtitle: Obx(
                    () => Text(
                      boringController.boringActivity[index].activity,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
