import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 226, 255, 225),
        elevation: 0,
      ),

      // body
      body: Container(
        color: const Color.fromARGB(255, 226, 255, 225),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("images/roseblackspotdsc0010.jpg"),
              ),
            ),
            const SizedBox(height: 60),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Color.fromARGB(98, 9, 60, 36),
              ),
              height: 350,
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 10),
                    height: 5,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  const Text(
                    "BLACK SPOT DISEASE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 129, 255, 83)),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      "Roses have great commercial value as ornamental plants, food and exports as cut flowers. Black spot is one of the most severe and devastating disease of roses. It is caused by black spot fungus. Symptoms of infection mainly include round spots with a black and feathery edge on the front side of the leaves.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 13, 28, 6)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
