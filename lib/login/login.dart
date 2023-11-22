// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Login(),
          ],
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Container(
          width: 343,
          height: 36,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        // Email TextField with rounded border
        Container(
          width: 343,
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 230, 230, 230),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10), // Move 10 pixels to the right
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 125, 125, 125),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        // Password TextField with rounded border
        Container(
          width: 343,
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 230, 230, 230),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10), // Move 10 pixels to the right
            child: Stack(
              children: [
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 125, 125, 125),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                  ),
                ),
                Positioned(
                  right: 10, // Align to the right
                  top: 16,
                  child: Text(
                    'Mostrar',
                    style: TextStyle(
                      color: Color(0xFF32D700),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 100),
        Container(
          height: 51,
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
          decoration: ShapeDecoration(
            color: Color(0xFF32D700),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Esqueceu a sua password?',
          style: TextStyle(
            color: Color(0xFF32D700),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
