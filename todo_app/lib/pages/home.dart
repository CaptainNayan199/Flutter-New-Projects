// import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
// import "package:flutter/widgets.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80.0, left: 50.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF4E65FF),
            Color(0xFF92EFFD),
            Color.fromARGB(255, 34, 236, 118)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello\nNayan",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Good Morning",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
