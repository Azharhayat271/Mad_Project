import 'package:flutter/material.dart';

class BiomedicalEngineeringScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biomedical Engineering Department'),
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
            Text('- Biomedical Engineering'),
            SizedBox(height: 20),
            Text(
              'Total Students: 200',
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
            Text('- Biomedical Engineers Society'),
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
            // Add other staff members similarly
          ],
        ),
      ),
    );
  }
}