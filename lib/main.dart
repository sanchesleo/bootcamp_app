import 'package:flutter/material.dart';
import 'package:ps13si/screens/screenArea.dart';
import 'package:ps13si/screens/screenBootcamps.dart';
import 'package:ps13si/screens/screenDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Color.fromRGBO(33, 33, 33, 1)
      ),
      initialRoute: '/screen-area',
      routes: {
        "/screen-area": (context) => ScreenArea(),
        "/screen-bootcamp": (context) => BootcampScreen(),
        "/screen-details": (context) => DetailsScreen(),
      },
    );
  }
}