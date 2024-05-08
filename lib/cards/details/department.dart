// DepartmentScreen.dart
import 'package:flutter/material.dart';
import './cs.dart';
import './civil.dart';
import './electrical.dart';
import './mechnical.dart';
import './bme.dart';
// Import other department screen files

class DepartmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Departments'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              children: [
                DepartmentCard(
                  departmentName: 'Computer Science',
                  chairman: 'Dr. Muhammad Idrees',
                  icon: Icons.computer,
                  departmentScreen: ComputerScienceScreen(),
                ),
                DepartmentCard(
                  departmentName: 'Civil Engineering',
                  chairman: 'Dr. Khawaja Adeel',
                  icon: Icons.flash_on,
                  departmentScreen: CivilEngineeringScreen(),
                ),

                DepartmentCard(
                  departmentName: 'Electrical Engineering',
                  chairman: 'Dr. Muhammad Usman',
                  icon: Icons.electrical_services,
                  departmentScreen: ElectricalEngineeringScreen(),
                ),

                DepartmentCard(
                  departmentName: 'Mechanical Engineering',
                  chairman: 'Dr. Muhammad Usman',
                  icon: Icons.engineering,
                  departmentScreen: MechanicalEngineeringScreen(),
                ),

                DepartmentCard(
                  departmentName: 'Biomedical Engineering',
                  chairman: 'Dr. Muhammad Usman',
                  icon: Icons.medical_services,
                  departmentScreen: BiomedicalEngineeringScreen(),
                ),

                // Add other department cards similarly
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DepartmentCard extends StatelessWidget {
  final String departmentName;
  final String chairman;
  final IconData icon;
  final Widget departmentScreen;

  const DepartmentCard({
    required this.departmentName,
    required this.chairman,
    required this.icon,
    required this.departmentScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        leading: Icon(icon),
        title: Text(departmentName),
        subtitle: Text('Chairman: $chairman'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => departmentScreen),
          );
        },
      ),
    );
  }
}
