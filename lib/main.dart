import 'package:flutter/material.dart';
//import 'package:izijob/footer.dart';
//mport 'package:izijob/registroVista.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Izi Job',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: Footer(),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
