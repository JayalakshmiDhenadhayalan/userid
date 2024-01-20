import 'package:flutter/material.dart';
import 'package:userlist/model/user_model.dart';
import 'package:http/http.dart' as http;

class userController extends ChangeNotifier {
  List<GetUserModel> getUserList = [];
   GetUserModel? getUserIdList;

  getUser() async {
    final url = 'https://jsonplaceholder.typicode.com/users';
    var response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final getUserModel = getUserModelFromJson(response.body);
        getUserList = getUserModel;
      
        print(getUserList);
        notifyListeners();
      } else {
        print("failed");
        notifyListeners();
      }
    } catch (e) {
      print("failedddd $e");
      notifyListeners();
    }
  }

  getIdList(num userId)async{
  getUserIdList=getUserList.firstWhere((e)=>e.id==userId);
  notifyListeners();

  }

  
}
