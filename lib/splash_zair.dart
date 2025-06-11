import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds:10),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Home()),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('images/img1.png'),
                  ),
                  SizedBox(height: 30),

                  // App Relevance Text
                  Text(
                    'Welcome to My Pics App!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),

                  // Quotation
                  Text(
                    'Uncover the unseen — one random frame at a time!',
                    style: TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 40),

                  // Loading Indicator
                  LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.tealAccent,
                    minHeight: 6,
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Loading Pictures, please wait...',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
