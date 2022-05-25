import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(BlackSpotDetector());
}

class BlackSpotDetector extends StatefulWidget {
  const BlackSpotDetector({Key? key}) : super(key: key);

  @override
  State<BlackSpotDetector> createState() => _BlackSpotDetectorState();
}

class _BlackSpotDetectorState extends State<BlackSpotDetector> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // BOTTOM NAVIGATION BAR
        bottomNavigationBar: const BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.orange,
          child: Text("THIS IS THE BOTTOM APPBAR"),
        ),

        floatingActionButton: FloatingActionButton(
          child: const Text("SNIP"),
          onPressed: () {
            print("this is the button to pick the image from the gallery");
          },
        ),

        // PUTTING THE FLOATING BUTTON IN THE MIDDLE
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // APPBAR
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("BLACKSPOT DETECTOR"),
        ),

        // DRAWER
        drawer: const Drawer(),

        // BODY
        body: const Center(
          child: Text(
              "THIS IS THE HOMEPAGE OF THE BLACKSPOT DISEASE DETECTOR IN ROSE FLOWERS."),
        ),
      ),
    );
  }
}
