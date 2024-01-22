import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:userlist/model/user_model.dart';
import 'package:http/http.dart' as http;

class userController extends ChangeNotifier {
  List<GetUserModel> getUserList = [];
   GetUserModel? getUserIdList;

 Future getUser() async {
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
String userName="";
String email='';
String street='';
String zipcode="";
String city='';
String phone='';
String website='';
String company='';
String Lat='';
String lng='';


 Future getIdList(num userId)async{
  getUserIdList=getUserList.firstWhere((e)=>e.id==userId);
  userName=getUserIdList!.username;
   email=getUserIdList!.email;
    street=getUserIdList!.address.street;
     zipcode=getUserIdList!.address.zipcode;
      city=getUserIdList!.address.city;
       phone=getUserIdList!.phone;
        website=getUserIdList!.website;
         company=getUserIdList!.company.name;
             Lat=getUserIdList!.address.geo.lat;
          lng=getUserIdList!.address.geo.lng;

  print(getUserIdList);
  notifyListeners();

  }


  Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url); // Convert String to Uri
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

  
}
