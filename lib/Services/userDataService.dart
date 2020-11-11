import 'package:github_Api/model/github_api_model.dart';

import 'package:http/http.dart' as http;



 Future <List<GithubModel>> userDataService() async {
 final  _url = 'https://api.github.com/users';
  var response = await http.get(_url);
    //var res = json.decode(response.body); //json object
  return githubModelFromJson(response.body);
     
    }