import 'package:flutter/material.dart';
import 'package:chatbotfrontend/pages/login.dart';
import 'package:chatbotfrontend/pages/signup.dart';
import 'package:chatbotfrontend/pages/unknown_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Your App',
        initialRoute: '/login',
        routes: {
          '/signup': (context) => SignInEight(),
          '/login': (context) => LoginPage(),
        },
        // Add an onUnknownRoute handler
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => UnknownRoutePage()));
  }
}
