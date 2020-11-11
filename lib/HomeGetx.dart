import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controllers/userControllers.dart';

class HomeGetx extends StatelessWidget {
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page 2"),
      ),
      body: GetX<UserController>(builder: (controller) {
        return ListView.builder(
          itemCount: controller.users.length,
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
                    title: Text(
                      userController.users[index].nodeId,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      controller.users[index].login,
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
