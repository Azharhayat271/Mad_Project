import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class HostelDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostel Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HostelCard(
              hostelType: 'Boys Hostel',
              facilities: [
                HostelFacility(
                    name: 'Mess',
                    icon: Icons.restaurant,
                    color: Colors.orange,
                    pdfName: 'boys_hostel_mess.pdf'),
                HostelFacility(
                    name: 'WiFi',
                    icon: Icons.wifi,
                    color: Colors.blue,
                    pdfName: 'boys_hostel_wifi.pdf'),
                HostelFacility(
                    name: 'Prayer Area',
                    icon: Icons.add_circle,
                    color: Colors.green,
                    pdfName: 'boys_hostel_prayer.pdf'),
                HostelFacility(
                    name: 'Sports Room',
                    icon: Icons.sports_soccer,
                    color: Colors.red,
                    pdfName: 'boys_hostel_sports.pdf'),
                HostelFacility(
                    name: 'TV Lounge',
                    icon: Icons.tv,
                    color: Colors.purple,
                    pdfName: 'boys_hostel_tv.pdf'),
              ],
            ),
            SizedBox(height: 16),
            HostelCard(
              hostelType: 'Girls Hostel',
              facilities: [
                HostelFacility(
                    name: 'Mess',
                    icon: Icons.restaurant,
                    color: Colors.orange,
                    pdfName: 'girls_hostel_mess.pdf'),
                HostelFacility(
                    name: 'WiFi',
                    icon: Icons.wifi,
                    color: Colors.blue,
                    pdfName: 'girls_hostel_wifi.pdf'),
                HostelFacility(
                    name: 'Prayer Area',
                    icon: Icons.add_circle,
                    color: Colors.green,
                    pdfName: 'girls_hostel_prayer.pdf'),
                HostelFacility(
                    name: 'Sports Room',
                    icon: Icons.sports_soccer,
                    color: Colors.red,
                    pdfName: 'girls_hostel_sports.pdf'),
                HostelFacility(
                    name: 'TV Lounge',
                    icon: Icons.tv,
                    color: Colors.purple,
                    pdfName: 'girls_hostel_tv.pdf'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HostelCard extends StatelessWidget {
  final String hostelType;
  final List<HostelFacility> facilities;

  HostelCard({required this.hostelType, required this.facilities});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hostelType,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Column(
              children: facilities.map((facility) {
                return Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        facility.icon,
                        size: 20,
                        color: facility.color,
                      ),
                      onPressed: () => _downloadPDF(context, facility.pdfName),
                    ),
                    SizedBox(width: 8),
                    Text(facility.name),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _downloadPDF(BuildContext context, String pdfName) async {
    final ByteData data = await rootBundle.load('assets/$pdfName');
    final Directory tempDir = await getTemporaryDirectory();
    final File tempFile = File('${tempDir.path}/$pdfName');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('PDF downloaded to device')));
  }
}

class HostelFacility {
  final String name;
  final IconData icon;
  final Color color;
  final String pdfName;

  HostelFacility(
      {required this.name,
      required this.icon,
      required this.color,
      required this.pdfName});
}

void main() {
  runApp(MaterialApp(
    home: HostelDetails(),
  ));
}
