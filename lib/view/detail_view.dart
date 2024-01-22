import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:userlist/controller/user_controller.dart';
import 'package:userlist/model/user_model.dart';
import 'package:userlist/view/map_view.dart';

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
    final idUser = Provider.of<userController>(context, listen: false)
        .getIdList(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final idUser = Provider.of<userController>(context, listen: false)
        .getIdList(widget.userId);
    return Scaffold(
      body: Consumer<userController>(
        builder: (context, value, child) => Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(value.userName),
                      Text(value.email),
                      Text(value.street),
                      Text(value.city),
                      Text(value.company),
                      Text(value.website),
                      Text(value.zipcode)
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                  value.launchURL('https://maps.google.com/?q=${value.Lat},${value.lng}');
                  print('https://maps.google.com/?q=${value.Lat},${value.lng}');
                   //  https://maps.google.com/?q=[lat],[long]
                          },
                          child: Text("Map"))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
