import 'package:flutter/material.dart';

class CivilEngineeringScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Civil Engineering Department'),
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
            Text('- Civil Engineering'),
            SizedBox(height: 20),
            Text(
              'Total Students: 250',
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
            Text('- Codator'),
            SizedBox(height: 20),
            Text(
              'Staff:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('- Dr. Muhammad Idrees (Chairman)'),
            Text('- Dr. Mubasshir Khatana'),
            Text('- Dr. Yaseen ul haq'),
            Text('- Dr. Iqra Muneer'),
            Text('- Miss Fatima Shahzadi'),
            Text('- Miss Sadia Tariq'),
            Text('- Miss Rabia Sana'),
            // Add other staff members similarly
          ],
        ),
      ),
    );
  }
}
