import 'package:blackspot_detector/results.dart';
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
              title: const Text("Take Image With Camera"),
              leading: const Icon(
                FontAwesomeIcons.camera,
                color: Colors.green,
              ),
              onTap: () async {
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.camera);

                var imgPath = image!.path;

                // await _prefs.setBool("imagePicked", true);

                Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Results(imageurl: imgPath)));
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

                var imgPath = image!.path;

                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Results(imageurl: imgPath)));
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
          title: const Text("BLACK SPOT DETECTOR"),
          foregroundColor: Colors.black,
        ),

        // DRAWER
        drawer: const MyDrawer(),

        // BODY
        body: ListView(
          children: [
            // SOME SPACING AT THE TOP
            const SizedBox(
              height: 45,
            ),

            // IMAGE OF ROSE WITH BLACK SPOT DISEASE
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("images/1st.jpg"),
              ),
            ),

            // ANOTHER SIZED BOX
            const SizedBox(height: 30),

            // TEXT FOR THE USER OF THE APP
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "To check if your rose plants are affected by black spot disease,  Please click the icon below.",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
