import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:smart_assistant_uni/ui/signup.dart';
import 'navbar.dart';
import 'admin/admin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _SignInEightState();
}

class _SignInEightState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
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
              //welcome text here
              Expanded(
                flex: 2,
                child: welcomeText(),
              ),

              //logo and loginPage text here
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    logo(size.height / 8, size.height / 8),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    richText(20.42),
                  ],
                ),
              ),

              //username , password textField and remember_forget text here
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    UserNameTextField(size),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    passwordTextField(size),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    rememberForgetText(),
                  ],
                ),
              ),

              //sign in, create account button and have account text here
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    signInButton(size),
                    const Spacer(),
                    buildNoAccountText(),
                    const Spacer(),
                    buildCreativeButton(size),
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
              text: 'Welcome Back',
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: 'Login',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: ' ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: 'for Continue !',
            ),
          ],
        ),
      ),
    );
  }

  Widget logo(double height_, double width_) {
    return SvgPicture.asset(
      'assets/logo.svg',
      height: height_,
      width: width_,
    );
  }

  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: 20.42,
          color: const Color(0xFF21899C),
          letterSpacing: 2.0000000290903555,
          fontWeight: FontWeight.w800,
        ),
        children: const [
          TextSpan(
            text: 'UET',
          ),
          TextSpan(
            text: 'Narowal',
            style: TextStyle(
              color: Color(0xFFFE9879),
            ),
          ),
        ],
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
          labelText: 'Username ',
          labelStyle: TextStyle(
            fontSize: 12.0,
            color: const Color(0xFF6A6F7D).withOpacity(0.6),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: usernameController.text.isEmpty
                ? const Color(0xFF151624).withOpacity(0.5)
                : const Color.fromRGBO(44, 185, 176, 1),
          )),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromRGBO(44, 185, 176, 1),
          )),
          suffix: Container(
            alignment: Alignment.center,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: const Color.fromRGBO(44, 185, 176, 1),
            ),
            child: usernameController.text.isEmpty
                ? const Center()
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 13,
                  ),
          ),
        ),
      ),
    );
  }

  Widget passwordTextField(Size size) {
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
          labelText: 'Password ',
          labelStyle: TextStyle(
            fontSize: 12.0,
            color: const Color(0xFF6A6F7D).withOpacity(0.6),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: passController.text.isEmpty
                ? const Color(0xFF151624).withOpacity(0.5)
                : const Color.fromRGBO(44, 185, 176, 1),
          )),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromRGBO(44, 185, 176, 1),
          )),
          suffix: Container(
            alignment: Alignment.center,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: const Color.fromRGBO(44, 185, 176, 1),
            ),
            child: passController.text.isEmpty
                ? const Center()
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 13,
                  ),
          ),
        ),
      ),
    );
  }

  Widget rememberForgetText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 13.0,
          height: 13.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.0),
            border: Border.all(
              width: 1.0,
              color: const Color(0xFF6A6F7D),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          'Remember me',
          style: TextStyle(
            fontSize: 11.0,
            color: const Color(0xFF6A6F7D),
          ),
        ),
        Expanded(
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 12.0,
              color: const Color(0xFF6A6F7D),
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Widget signInButton(Size size) {
    return ElevatedButton(
      onPressed: isLoading ? null : signIn,
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
              'Sign in',
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

  Widget buildNoAccountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Expanded(
          flex: 2,
          child: Divider(
            color: Color(0xFF969AA8),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            'Don’t Have Account?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              color: const Color(0xFF969AA8),
              fontWeight: FontWeight.w500,
              height: 1.67,
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: Divider(
            color: Color(0xFF969AA8),
          ),
        ),
      ],
    );
  }

  Widget buildCreativeButton(Size size) {
    return Container(
        width: size.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF21899C),
              Color(0xFF33CCCC),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpPage()),
            );
          },
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(15.0),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ));
  }

  void signIn() async {
    setState(() {
      isLoading = true;
    });

    final username = usernameController.text;
    final password = passController.text;

    final response = await http.post(
      Uri.parse(
          'https://uet-narowal-chatbot-server.onrender.com/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      final String username = usernameController.text;

      if (username == 'admin') {
        // Navigate to the admin page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AdminHomePage(), // Replace AdminPage with your actual admin page
          ),
        );
      } else {
        // Navigate to CustomBottomNavBar
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CustomBottomNavBar(),
          ),
        );
      }
    } else {
      // Show invalid credential message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Credentials'),
            content: Text('Please enter valid username and password.'),
            actions: [
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
