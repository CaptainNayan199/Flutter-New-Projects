import 'package:flutter/material.dart';
import 'package:qr_code/qr_scanner.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "QR Scanner",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "Scanned Result",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Results : ",
              style: TextStyle(
                  color: Colors.black87, fontSize: 16, letterSpacing: 1),
            ),
            SizedBox(
              height: 10,
            ),
            
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 38,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  
                ),
                onPressed: () {},
                child: Text(
                  "Copy",
                  style: TextStyle(
                      color: Colors.black87, fontSize: 16, letterSpacing: 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
