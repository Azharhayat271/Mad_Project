import 'package:flutter/material.dart';
import './../card_screens//labinfor.dart'; // Import the ParticleLabsInformation.dart screen

class ParticleLabsInformationCard extends StatelessWidget {
  const ParticleLabsInformationCard({Key? key});

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
                    ParticleLabsInformationScreen()), // Navigate to ParticleLabsInformation.dart screen
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.scatter_plot_rounded,
                  size: 40, color: Colors.orange), // Particle Labs icon
              SizedBox(height: 10),
              Text('Particle Labs',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Explore particle physics and experiments.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
