import 'package:blackspot_detector/info.dart';
import 'package:blackspot_detector/internet.dart';
import 'package:flutter/material.dart';
import 'results.dart';
import 'homepage.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var imagePath;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlackSpotDetector(),
      routes: {
        'results': (context) => Results(
              imageurl: imagePath,
            ),
        'info': (context) => const Info(),
        'home': (context) => const BlackSpotDetector(),
      },
    );
  }
}
