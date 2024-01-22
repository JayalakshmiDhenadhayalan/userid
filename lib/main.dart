import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlist/controller/user_controller.dart';
import 'package:userlist/view/home_view.dart';
import 'package:userlist/view/map_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
    create: (_) => userController(),
  ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User List',
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeView()
      ),
    );
  }
}


