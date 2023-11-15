import 'package:flutter/material.dart';

void main() {
  runApp(const Pertemuan2());
}

class Pertemuan2 extends StatelessWidget {
  const Pertemuan2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 205, 0, 0),
          title: const Text("Godrej"),
          toolbarHeight: 60,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                'images/search.png',
                width: 15,
                height: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                'images/basket.png',
                width: 15,
                height: 15,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
