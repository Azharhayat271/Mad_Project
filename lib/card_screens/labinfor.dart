import 'package:flutter/material.dart';

class ParticleLabsInformationScreen extends StatelessWidget {
  const ParticleLabsInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Particle Labs Information'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DepartmentLabs(
              department: 'Computer Science',
              description:
                  'State-of-the-art computer labs equipped with high-tech PCs for simulations and data analysis.',
              properties: [
                LabProperty(
                    icon: Icons.desktop_windows,
                    color: Colors.blue,
                    description: 'Advanced computing resources'),
                LabProperty(
                    icon: Icons.storage,
                    color: Colors.green,
                    description: 'Simulation software'),
                LabProperty(
                    icon: Icons.wifi,
                    color: Colors.orange,
                    description: 'High-speed internet connection'),
              ],
            ),
            SizedBox(height: 16),
            DepartmentLabs(
              department: 'Civil Engineering',
              description:
                  'Advanced labs for testing building materials, soil analysis, and structural simulations.',
              properties: [
                LabProperty(
                    icon: Icons.build,
                    color: Colors.brown,
                    description: 'Material testing equipment'),
                LabProperty(
                    icon: Icons.landscape,
                    color: Colors.green,
                    description: 'Soil analysis tools'),
                LabProperty(
                    icon: Icons.graphic_eq,
                    color: Colors.blue,
                    description: 'Structural simulation software'),
              ],
            ),
            SizedBox(height: 16),
            DepartmentLabs(
              department: 'Electrical Engineering',
              description:
                  'Cutting-edge labs for electronics, power systems, and renewable energy research.',
              properties: [
                LabProperty(
                    icon: Icons.electrical_services,
                    color: Colors.yellow,
                    description: 'Electronics testing instruments'),
                LabProperty(
                    icon: Icons.power,
                    color: Colors.red,
                    description: 'Power systems analysis tools'),
                LabProperty(
                    icon: Icons.eco,
                    color: Colors.green,
                    description: 'Renewable energy testbeds'),
              ],
            ),
            SizedBox(height: 16),
            DepartmentLabs(
              department: 'Biomedical Engineering',
              description:
                  'Specialized labs for biomedical imaging, biomaterials, and medical device development.',
              properties: [
                LabProperty(
                    icon: Icons.biotech,
                    color: Colors.purple,
                    description: 'Biomedical imaging equipment'),
                LabProperty(
                    icon: Icons.bloodtype,
                    color: Colors.red,
                    description: 'Biomaterials testing facilities'),
                LabProperty(
                    icon: Icons.medical_services,
                    color: Colors.blue,
                    description: 'Medical device prototyping tools'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DepartmentLabs extends StatelessWidget {
  final String department;
  final String description;
  final List<LabProperty> properties;

  const DepartmentLabs({
    required this.department,
    required this.description,
    required this.properties,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              department,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: properties.map((property) {
                return Row(
                  children: [
                    Icon(property.icon, size: 20, color: property.color),
                    SizedBox(width: 5),
                    Text(property.description),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class LabProperty {
  final IconData icon;
  final Color color;
  final String description;

  LabProperty({
    required this.icon,
    required this.color,
    required this.description,
  });
}
