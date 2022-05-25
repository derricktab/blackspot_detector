import 'package:flutter/material.dart';

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
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 226, 255, 225),
              ),
              child: Column(
                children: const [
                  Text("BS DETECTOR"),
                ],
              ))
        ],
      ),
    );
  }
}
