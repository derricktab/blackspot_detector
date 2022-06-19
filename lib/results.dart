import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Results extends StatefulWidget {
  final String imageurl;

  const Results({required this.imageurl, Key? key}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  var predicted_class = "";
  var confidence = 0.0;
  var textColor = Colors.black;
  var displayWords = "";
  var pred_confidence = 0.0;
  var _loaded = false;

  upload(File imageFile) async {
    // instantiating DIO
    var dio = Dio();

    // API URL
    var url = "https://blackspotdetection-pntfqu3rxa-ez.a.run.app/predit/";

    // GETTING THE IMAGE
    var formData = FormData.fromMap({
      'file':
          await MultipartFile.fromFile(imageFile.path, filename: "image.png"),
    });

    // SENDING THE IMAGE TO API
    var response = await dio.post(
      url,
      data: formData,
      onReceiveProgress: (int A, int B) {
        setState(() {
          _loaded = true;
          print("loaded");
        });
      },
    );

    setState(() {
      predicted_class = response.data["prediction"];
      confidence = response.data["confidence"];
    });

    if (predicted_class == "BLACK_SPOT") {
      setState(() {
        displayWords = "Your Plant is Infected with Black Spot Disease";
        textColor = Colors.red;
        pred_confidence = confidence;
      });
    } else if (predicted_class == "HEALTHY") {
      setState(() {
        displayWords = "Your Rose Flower Is Healthy! No Black spot Detected";
        textColor = Colors.green;
        pred_confidence = 100 - confidence;
      });
    }
  }

  @override
  void initState() {
    upload(File(widget.imageurl));
    print("INSTANTIATED");
  }

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

                Navigator.pop(context);
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
    return _loaded
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Results"),
              centerTitle: true,
              foregroundColor: Colors.black,
              backgroundColor: const Color.fromARGB(255, 226, 255, 225),
            ),
            body: ListView(
              children: [
                const SizedBox(height: 20),

                // CAPTURED IMAGE
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        File(widget.imageurl),
                        height: 380,
                        fit: BoxFit.fill,
                      )),
                ),

                const SizedBox(height: 10),
                // OUTPUT RESULTS
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 172, 175, 167),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: const Color.fromARGB(255, 115, 172, 189),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Text(
                        displayWords,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "times new roman",
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // BLACK SPOT PROBABILITY
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Black Spot Probability: ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(pred_confidence.toStringAsFixed(1) + "%",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              )),
                        ],
                      ),
                      const SizedBox(height: 5),

                      // BUTTON TO TAKE ANOTHER PICTURE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ElevatedButton(
                          //     onPressed: () {}, child: const Text("BACK TO HOME")),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                            child: const Text(
                              "Take Another Picture",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _popupDialog(context));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ))
        : Scaffold(
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
                        color: Color.fromARGB(255, 241, 241, 225),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
  }
}
