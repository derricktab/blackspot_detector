import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // DRAWER HEADER
          DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                color: Color.fromARGB(255, 128, 219, 125),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "BLACK SPOT DETECTOR",
                    style: TextStyle(
                      fontFamily: "times new roman",
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),

          // const SizedBox(height: 1),

          const Divider(
            color: Colors.green,
            thickness: 2,
            height: 0,
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
            height: 4,
          ),

          // DRAWER NAV ITEMS
          ListTile(
            // HOME
            title: const Text("HOME"),
            leading: const Icon(
              FontAwesomeIcons.houseChimney,
              color: Colors.green,
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, "home");
            },
          ),

          const Divider(
            color: Colors.black,
            thickness: 0.8,
            height: 0,
          ),

          // RESULTS
          ListTile(
            title: const Text("INFO"),
            leading: const Icon(
              FontAwesomeIcons.listCheck,
              color: Colors.green,
            ),
            onTap: () {
              Navigator.pushNamed(context, "info");
            },
          ),

             const Divider(
            color: Colors.black,
            thickness: 0.8,
            height: 0,
          )
        ],
      ),
    );
  }
}
