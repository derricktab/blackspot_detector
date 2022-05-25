import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'drawer.dart';

class BlackSpotDetector extends StatefulWidget {
  const BlackSpotDetector({Key? key}) : super(key: key);

  @override
  State<BlackSpotDetector> createState() => _BlackSpotDetectorState();
}

class _BlackSpotDetectorState extends State<BlackSpotDetector> {
  // instantiating the image picker class.
  final ImagePicker _picker = ImagePicker();

  String pickedImagePath = "";
  bool imagePicked = false;

// POPUP DIALOG TO ENABLE USER SELECT SOURCE OF IMAGE
  _popupDialog(BuildContext context) {
    return AlertDialog(
        title: const Text(
          "SELECT IMAGE SOURCE",
          style: TextStyle(fontSize: 19),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // PICKING IMAGE FROM CAMERA
            ListTile(
              title: const Text("Pick From Camera"),
              leading: const Icon(
                FontAwesomeIcons.camera,
                color: Colors.green,
              ),
              onTap: () async {
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.camera);
                // printing the image path
                print(image!.path);
                setState(() {
                  pickedImagePath = image.path;
                  imagePicked = true;
                });

                Navigator.pop(context);
              },
            ),

            // PICKING IMAGE FROM GALLERY
            ListTile(
              title: const Text("Pick From Gallery"),
              leading: const Icon(
                FontAwesomeIcons.image,
                color: Colors.green,
              ),
              onTap: () async {
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
                // printing the image path
                print(image!.path);
                setState(() {
                  pickedImagePath = image.path;
                  imagePicked = true;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // BOTTOM NAVIGATION BAR
        bottomNavigationBar: const BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Color.fromARGB(255, 19, 133, 23),
          child: Text(""),
        ),

        // CAMERA ICON BUTTON
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 109, 144, 69),
          child: const Icon(FontAwesomeIcons.cameraRetro),
          onPressed: () async {
            showDialog(
                context: context,
                builder: (BuildContext context) => _popupDialog(context));
          },
        ),

        // PUTTING THE FLOATING BUTTON IN THE MIDDLE
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // APPBAR
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 226, 255, 225),
          title: const Text("BLACKSPOT DETECTOR"),
          foregroundColor: Colors.black,
        ),

        // DRAWER
        drawer: const MyDrawer(),

        // BODY
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
              ),
              child: Image.asset("images/1st.jpg"),
            ),
          ],
        ));
  }
}
