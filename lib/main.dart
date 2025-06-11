import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labwork8/home.dart' show Home;
import 'splash_zair.dart';

// void main() {
//   runApp(Screen());
// }
//
// class Screen extends StatelessWidget {
//   const Screen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen();
//   }
// }


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
