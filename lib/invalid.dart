import "package:flutter/material.dart";

class Invalid extends StatelessWidget {
  const Invalid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // STOP IMAGE
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Image.asset("images/stop.jpg"),
          ),

          // TEXT
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              "Looks Like The Image You Selected Is Not A Rose Flower, Please Select A Rose Flower Image",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontFamily: "times new roman"),
            ),
          ),
          const SizedBox(height: 30),
          // BACK BUTTON
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"))
        ],
      ),
    );
  }
}
