import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlist/controller/user_controller.dart';
import 'package:userlist/model/user_model.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.userId});
  final num userId;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  void initState() {
    Provider.of<userController>(context, listen: false).getUser();
      GetUserModel id=   Provider.of<userController>(context, listen: false).getIdList(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Text(
                   widget. id.name
                    ),
                    Text(id.email),
                    Text(id.phone),
                    Text(
                      id.address.street,
                    ),
                    Text(id.address.zipcode),
                    Text(id.company.name)
                  ],
                ),
              );
        ],
      ),
    );
  }
}
