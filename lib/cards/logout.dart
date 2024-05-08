import 'package:flutter/material.dart';
import "../ui/splash_screen.dart";

class LogoutCard extends StatelessWidget {
  const LogoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Add your confirmation dialog here
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Logout Confirmation"),
              content: Text("Are you sure you want to logout?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                      (route) => false,
                    ); // Navigate to the home screen and remove all routes from the stack
                  },
                  child: Text("Logout"),
                ),
              ],
            );
          },
        );
      },
      child: const Card(
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.logout, size: 40),
              SizedBox(height: 10),
              Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Click here to logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
