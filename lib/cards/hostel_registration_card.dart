// File: hostel_registration_card.dart
import 'package:flutter/material.dart';
import '../card_screens/hostel_registration_screen.dart';

class HostelRegistrationCard extends StatelessWidget {
  const HostelRegistrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Add your navigation code here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HostelDetails()),
        );
      },
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.hotel, size: 40),
              SizedBox(height: 10),
              Text('Hostel Facilities',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Get settled into your new home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Similarly create files like: info_card.dart, map_card.dart, chat_card.dart
