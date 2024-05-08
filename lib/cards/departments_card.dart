import 'package:flutter/material.dart';
import './details//department.dart'; // Import your department screen file

class DepartmentsCard extends StatelessWidget {
  const DepartmentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to your department screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DepartmentScreen()),
        );
      },
      child: const Card(
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.school, size: 40, color: Colors.brown),
              SizedBox(height: 10),
              Text('Academia', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text('Explore academic programs.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
