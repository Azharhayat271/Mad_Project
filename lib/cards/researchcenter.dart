import 'package:flutter/material.dart';
import './research_info.dart'; // Import the ResearchInformation.dart screen

class ResearchInformationCard extends StatelessWidget {
  const ResearchInformationCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ResearchInformationScreen()), // Navigate to ResearchInformation.dart screen
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.science_outlined,
                  size: 40, color: Colors.green), // Research icon
              SizedBox(height: 10),
              Text('Research Center',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Explore cutting-edge research and resources.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
