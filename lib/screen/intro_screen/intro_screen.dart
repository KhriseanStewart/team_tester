import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
            child: Image.asset("assets/intro_image1.jpg", fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
