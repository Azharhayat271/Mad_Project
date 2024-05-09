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
            _buildSection('Programs Offered', Icons.architecture,
                ['Masters Programs', 'Bachelors Programs: Civil Engineering']),
            SizedBox(height: 20),
            _buildSection('Departmental Societies', Icons.groups, ['ACE CESA']),
            SizedBox(height: 20),
            Text(
              'Staff',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildStaffCard('Dr. Khawaja Adeel', 'Chairman'),
            _buildStaffCard('Dr. Thair', ''),
            _buildStaffCard('Dr. Shoiab karam', ''),
            _buildStaffCard('Miss Sherish', ''),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        for (var item in items)
          Row(
            children: [
              Icon(icon, size: 24),
              SizedBox(width: 8.0),
              Text(item),
            ],
          ),
      ],
    );
  }

  Widget _buildStaffCard(String name, String title) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.person, size: 40),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  if (title.isNotEmpty) Text(title),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
