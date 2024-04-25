import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HostelRegistrationScreen extends StatelessWidget {
  const HostelRegistrationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hostel Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: HostelRegistrationForm(),
      ),
    );
  }
}

class HostelRegistrationForm extends StatefulWidget {
  const HostelRegistrationForm({Key? key});

  @override
  _HostelRegistrationFormState createState() => _HostelRegistrationFormState();
}

class _HostelRegistrationFormState extends State<HostelRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cnicController = TextEditingController();
  TextEditingController _rollController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _domicileController = TextEditingController();
  TextEditingController _marksController = TextEditingController();
  TextEditingController _documentsLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _cnicController,
            decoration: InputDecoration(labelText: 'CNIC'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your CNIC';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _rollController,
            decoration: InputDecoration(labelText: 'Roll Number'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your roll number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _genderController,
            decoration: InputDecoration(labelText: 'Gender'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your gender';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _domicileController,
            decoration: InputDecoration(labelText: 'Domicile'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your domicile';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _marksController,
            decoration: InputDecoration(labelText: 'Marks'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your marks';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _documentsLinkController,
            decoration: InputDecoration(labelText: 'Documents Link'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the link to your documents';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final response = await http.post(
                  Uri.parse(
                      'https://uet-narowal-chatbot-server.onrender.com/api/hostel/students'),
                  body: {
                    'studentName': _nameController.text,
                    'cnic': _cnicController.text,
                    'rollNumber': _rollController.text,
                    'gender': _genderController.text,
                    'domicile': _domicileController.text,
                    'ecadMarks': _marksController.text,
                    'documentsLinks': _documentsLinkController.text,
                  },
                );
                if (response.statusCode == 201) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Success'),
                      content: Text('Data submitted successfully!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Error in registering the student.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
