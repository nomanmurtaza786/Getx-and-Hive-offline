import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_Api/Controllers/boringAppController.dart';
import 'package:github_Api/Controllers/userControllers.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageOBX extends StatelessWidget {
  final userController = Get.find<UserController>();
  //final boringController = Get.put(BoringAppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageOBX'),
      ),
      body: Obx(
        () {
          return RefreshIndicator(
            onRefresh: userController.userDataService,
            child: ListView.builder(
              itemCount: userController.users.length,
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
                  userController.users[index].login,
                  style: TextStyle(fontSize: 20),
                )),
            subtitle: Obx(
              () => Text(
                userController.users[index].nodeId,
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
        },
      ),
    );
  }
}
