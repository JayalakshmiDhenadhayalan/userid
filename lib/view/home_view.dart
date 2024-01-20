import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlist/controller/user_controller.dart';
import 'package:userlist/view/detail_view.dart';
TextEditingController searchController=TextEditingController();
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
        Provider.of<userController>(context, listen: false)
          .getUser();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Consumer<userController>(
        builder: (context, value, child) =>  Column(
          children: [
            Container(height: 30,
              child: Row(
                children: [
                  Icon(Icons.search),
                  // TextField(
                  //   controller: searchController,
                  //   onChanged: (value) {
                      
                  //   }
                    
                  // )
                ],
              ),
            ),
      
           Expanded(
             child: ListView.separated(
               itemCount: value.getUserList.length,
               separatorBuilder: (BuildContext context, int index) {
                 return SizedBox(height: 10,);
               },
               itemBuilder: (BuildContext context, int index) {
                 return InkWell(
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailView(userId: value.getUserList[index].id,)));

                  },
                   child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(value.getUserList[index].username,),
                        Text(value.getUserList[index].email),
                        Text(value.getUserList[index].address.street),
                         Text(value.getUserList[index].address.city)
                      ],
                    ),
                   
                   ),
                 );
               },
             ),
           ),
      
          ],
        ),
      )
    

    );
  }
}