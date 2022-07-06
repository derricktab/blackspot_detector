import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Detecting extends StatefulWidget {
  const Detecting({Key? key}) : super(key: key);

  @override
  State<Detecting> createState() => _DetectingState();
}

class _DetectingState extends State<Detecting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Setting a gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 226, 255, 225),
              Color.fromARGB(255, 6, 65, 8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // color: Colors.greenAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SpinKitWanderingCubes(
              color: Colors.white,
              size: 130.0,
            ),
            SizedBox(height: 60),
            Text(
              "Detecting.......",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 33,
                  color: Color.fromARGB(255, 243, 243, 147),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
