import 'package:flutter/material.dart';
import 'login.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UET Smart Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial route
      routes: {
        '/home': (context) =>
            LoginPage(), // Define the route for the home screen
      },
    );
  }
}
