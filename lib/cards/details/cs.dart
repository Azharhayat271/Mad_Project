// import 'package:flutter/material.dart';

// class ComputerScienceScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Computer Science Department'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Programs Offered:',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Masters Programs',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Bachelors Programs:',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text('- Computer Science'),
//             SizedBox(height: 20),
//             Text(
//               'Total Students: 250',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Departmental Societies:',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text('- Codator'),
//             SizedBox(height: 20),
//             Text(
//               'Staff:',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text('- Dr. Muhammad Idrees (Chairman)'),
//             Text('- Dr. Mubasshir Khatana'),
//             Text('- Dr. Yaseen ul haq'),
//             Text('- Dr. Iqra Muneer'),
//             Text('- Miss Fatima Shahzadi'),
//             Text('- Miss Sadia Tariq'),
//             Text('- Miss Rabia Sana'),

//             // Add other staff members similarly
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ComputerScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Science Department'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Programs Offered', Icons.school,
                ['Masters Programs', 'Bachelors Programs: Computer Science']),
            SizedBox(height: 20),
            _buildSection('Departmental Societies', Icons.groups, [
              'Codator',
            ]),
            SizedBox(height: 20),
            Text(
              'Staff',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildStaffCard('Dr. Muhammad Idrees', 'Chairman'),
            _buildStaffCard('Dr. Mubasshir Khatana', ''),
            _buildStaffCard('Dr. Yaseen ul haq', ''),
            _buildStaffCard('Dr. Iqra Muneer', ''),
            _buildStaffCard('Miss Fatima Shahzadi', ''),
            _buildStaffCard('Miss Sadia Tariq', ''),
            _buildStaffCard('Miss Rabia Sana', ''),
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
            Icon(Icons.person, size: 40), // Use the person icon
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
