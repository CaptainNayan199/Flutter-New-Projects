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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF4E65FF), Color(0xFF92EFFD), Color.fromARGB(255, 34, 236, 118)],begin: Alignment.topRight, end: Alignment.bottomLeft),),
        child: Column(children: [
          Text("Hello\nNayan", style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
          ),)
        ],),
      ),
    );
  }
}