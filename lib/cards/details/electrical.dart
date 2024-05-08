import 'package:flutter/material.dart';

class ElectricalEngineeringScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electrical Engineering Department'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Programs Offered:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Masters Programs',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Bachelors Programs:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('- Electrical Engineering'),
            SizedBox(height: 20),
            Text(
              'Total Students: 300',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Departmental Societies:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('- Electrician Society'),
            SizedBox(height: 20),
            Text(
              'Staff:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('- Dr. Ali Khan (Chairman)'),
            Text('- Dr. Sarah Ahmed'),
            Text('- Dr. Usman Ali'),
            Text('- Dr. Ayesha Siddiqua'),
            Text('- Miss Saba Naz'),
            Text('- Miss Saima Bibi'),
            // Add other staff members similarly
          ],
        ),
      ),
    );
  }
}
