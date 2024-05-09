import 'package:flutter/material.dart';

class ResearchInformationScreen extends StatelessWidget {
  const ResearchInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Research Center Information'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'State-of-the-Art Facilities',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.science, color: Colors.green),
              title: Text('Advanced Laboratory Equipment'),
              subtitle: Text('High-tech equipment for research experiments.'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.computer, color: Colors.blue),
              title: Text('Supercomputing Resources'),
              subtitle: Text(
                  'Access to powerful computing resources for data analysis.'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.wifi, color: Colors.orange),
              title: Text('High-speed Internet Connectivity'),
              subtitle: Text(
                  'Fast and reliable internet connection for research activities.'),
            ),
            Divider(),
            Text(
              'Expert Research Teams',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.group, color: Colors.purple),
              title: Text('Interdisciplinary Research Teams'),
              subtitle:
                  Text('Collaborative efforts across various disciplines.'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person, color: Colors.red),
              title: Text('Experienced Research Supervisors'),
              subtitle: Text(
                  'Guidance from seasoned researchers in different fields.'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.school, color: Colors.deepOrange),
              title: Text('Training and Workshops'),
              subtitle:
                  Text('Continuous learning opportunities for researchers.'),
            ),
          ],
        ),
      ),
    );
  }
}
