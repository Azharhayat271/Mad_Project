import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to UET Narowal Smart Assistant Admin Panel',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to Dashboard
            },
            child: Text('Go to Dashboard'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Navigate to Users Page
            },
            child: Text('Manage Users'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Navigate to Settings Page
            },
            child: Text('App Settings'),
          ),
        ],
      ),
    );
  }
}
