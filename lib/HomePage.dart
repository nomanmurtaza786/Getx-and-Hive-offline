import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
//import 'dart:convert';
import 'package:github_Api/model/github_api_model.dart';

import 'Services/userDataService.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final  url = 'https://api.github.com/users';
  
  var isloading = false;
  List <GithubModel> _userdata =[];
 

 


  @override
  void initState() {
    setState(() {
       userDataService().then((value1) => {
      _userdata = value1
      
    }
    );
    });
   


    super.initState();
  }

 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _userdata.length,
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
                    _userdata[index].login,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    _userdata[index].nodeId
                    ,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
