import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Information'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              icon: Icons.location_city, // Icon for campus coordinator
              title: 'Campus Coordinator',
              content: 'Dr Muhammad Shahbaz',
            ),
            SizedBox(height: 20),
            _buildSection(
              icon: Icons.people, // Icon for DSA
              title: 'DSA (Directors of Student Affairs)',
              content: 'Dr Habib ur Rehman',
            ),
            SizedBox(height: 20),
            _buildSection(
              icon: Icons.group, // Icon for campus societies
              title: 'Campus Societies',
              content: 'UET Newsline, UET Tribune, UET Media Society',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      {required IconData icon,
      required String title,
      required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(content),
                ],
              ),
            ),
          ],
        ),
        Divider(), // Add a divider between sections
      ],
    );
  }
}
