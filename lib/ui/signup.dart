import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: <Widget>[
              // Welcome text here
              Expanded(
                flex: 2,
                child: welcomeText(),
              ),

              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    logo(size.height / 8, size.height / 8),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                  ],
                ),
              ),

              // Input fields for name, username, email, and password
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      NameTextField(size),
                      SizedBox(height: size.height * 0.01),
                      UserNameTextField(size),
                      SizedBox(height: size.height * 0.01),
                      EmailTextField(size),
                      SizedBox(height: size.height * 0.01),
                      PasswordTextField(size),
                    ],
                  ),
                ),
              ),

              // Sign up button
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    signUpButton(size),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget welcomeText() {
    return const Center(
      child: Text.rich(
        TextSpan(
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.black,
            height: 1.45,
          ),
          children: [
            TextSpan(
              text: 'Welcome, ',
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: ' to continue!',
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget NameTextField(Size size) {
    return SizedBox(
      height: size.height / 10,
      child: TextField(
        controller: nameController,
        maxLines: 1,
        keyboardType: TextInputType.name,
        cursorColor: const Color.fromRGBO(44, 185, 176, 1),
        style: const TextStyle(
          fontSize: 17.0,
          color: Color(0xFF36455A),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: 'Name',
          labelStyle: TextStyle(
            fontSize: 12.0,
            color: const Color(0xFF6A6F7D).withOpacity(0.6),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UserNameTextField(Size size) {
    return SizedBox(
      height: size.height / 10,
      child: TextField(
        controller: usernameController,
        maxLines: 1,
        keyboardType: TextInputType.name,
        cursorColor: const Color.fromRGBO(44, 185, 176, 1),
        style: const TextStyle(
          fontSize: 17.0,
          color: Color(0xFF36455A),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: TextStyle(
            fontSize: 12.0,
            color: const Color(0xFF6A6F7D).withOpacity(0.6),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget EmailTextField(Size size) {
    return SizedBox(
      height: size.height / 10,
      child: TextField(
        controller: emailController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color.fromRGBO(44, 185, 176, 1),
        style: const TextStyle(
          fontSize: 17.0,
          color: Color(0xFF36455A),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(
            fontSize: 12.0,
            color: const Color(0xFF6A6F7D).withOpacity(0.6),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget logo(double height_, double width_) {
    return Image.asset(
      'assets/uet.png',
      width: 100,
      height: 100,
    );
  }

  Widget PasswordTextField(Size size) {
    return SizedBox(
      height: size.height / 10,
      child: TextField(
        controller: passController,
        maxLines: 1,
        obscureText: true,
        cursorColor: const Color.fromRGBO(44, 185, 176, 1),
        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(
          fontSize: 17.0,
          color: const Color(0xFF36455A),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
            fontSize: 12.0,
            color: const Color(0xFF6A6F7D).withOpacity(0.6),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpButton(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: ElevatedButton(
        onPressed: isLoading ? null : signUp,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isLoading
                ? const Color.fromARGB(255, 1, 0, 0)
                : const Color(0xFFE67E22), // Changed color here
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }

  void signUp() async {
    setState(() {
      isLoading = true;
    });

    final name = nameController.text;
    final username = usernameController.text;
    final email = emailController.text;
    final password = passController.text;

    final response = await http.post(
      Uri.parse(
          'https://uet-narowal-chatbot-server.onrender.com/api/auth/registeraccount'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 201) {
      // Show success pop-up
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Successful'),
            content: Text('Your account has been created successfully.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Navigate to login page
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Show error pop-up
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Failed'),
            content: Text('Failed to create your account. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
