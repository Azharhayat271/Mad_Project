import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _accessToken =
      'pk.eyJ1IjoiYXpoYXJoYXlhdDI3MSIsImEiOiJjbHZ4ZGsyZm8wOTFhMmpudDF2Y2gzaDE5In0.aAchbxCCuj6vUsuBfirP8Q'; // Replace with your token

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MapboxMap(
          accessToken: _accessToken,
          initialCameraPosition: const CameraPosition(
            // Use const constructor
            target: LatLng(32.097573,
                74.764942), // San Francisco (replace with your desired location)
            zoom: 13.0,
          ),
        ),
      ),
    );
  }
}
