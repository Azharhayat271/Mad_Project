import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:flutter/scheduler.dart'; // Import for animation
import 'package:lottie/lottie.dart'; // Import for Lottie animation

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  String _accessToken =
      'pk.eyJ1IjoiYXpoYXJoYXlhdDI3MSIsImEiOiJjbHZ4ZGsyZm8wOTFhMmpudDF2Y2gzaDE5In0.aAchbxCCuj6vUsuBfirP8Q'; // Replace with your token

  late MapboxMapController _controller;
  late AnimationController _animController;
  late Animation<double> _zoomAnim;

  bool _animationPlayed = false; // Track if animation played

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1500) // Animation duration
        );

    _zoomAnim = Tween<double>(begin: 12.0, end: 13.0).animate(_animController);
  }

  void _onMapCreated(MapboxMapController controller) {
    _controller = controller;
    _addMarkers();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!_animationPlayed) {
        _playAnimation(); // Trigger the animation only once
        _animationPlayed = true;
      }
    });
  }

  void _addMarkers() {
    _controller.addSymbol(SymbolOptions(
      geometry: LatLng(32.097573, 74.764942), // Adjust coordinates
      iconImage: 'assets/icon.png', // Your marker icon image path
      iconSize: 3,
    ));
  }

  void _playAnimation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Lottie.asset(
              'assets/animation.json'), // Replace with your animation file path
        );
      },
    );

    // Close the dialog after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
  }

  void _animateCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(32.097573, 74.764942), // Adjust coordinates
        zoom: _zoomAnim.value)));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MapboxMap(
          accessToken: _accessToken,
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            // Use const constructor
            target: LatLng(32.097573, 74.764942), // Adjust coordinates
            zoom: 12.0, // Initial zoom level before animation
          ),
        ),
      ),
    );
  }
}
