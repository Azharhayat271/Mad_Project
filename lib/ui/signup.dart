import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    return Center(
      child: Text.rich(
        TextSpan(
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.black,
            height: 1.45,
          ),
          children: const [
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

  Widget NameTextField(Size size) {
    return SizedBox(
      height: size.height / 10,
      child: TextField(
        controller: nameController,
        maxLines: 1,
        keyboardType: TextInputType.name,
        cursorColor: const Color.fromRGBO(44, 185, 176, 1),
        style: TextStyle(
          fontSize: 17.0,
          color: const Color(0xFF36455A),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: 'Name',
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

  Widget UserNameTextField(Size size) {
    return SizedBox(
      height: size.height / 10,
      child: TextField(
        controller: usernameController,
        maxLines: 1,
        keyboardType: TextInputType.name,
        cursorColor: const Color.fromRGBO(44, 185, 176, 1),
        style: TextStyle(
          fontSize: 17.0,
          color: const Color(0xFF36455A),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: 'Username',
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

  Widget EmailTextField(Size size) {
    return SizedBox(
      height: size.height / 10,
      child: TextField(
        controller: emailController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color.fromRGBO(44, 185, 176, 1),
        style: TextStyle(
          fontSize: 17.0,
          color: const Color(0xFF36455A),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: 'Email',
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
    return ElevatedButton(
      onPressed: isLoading ? null : signUp,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isLoading
              ? Colors.grey
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
      Uri.parse('YOUR_SIGNUP_API_ENDPOINT'),
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

    if (response.statusCode == 200) {
      // Handle successful sign-up
      // You may navigate to another screen or show a success message
    } else {
      // Handle sign-up failure
      // You can display an error message to the user
    }
  }
}
