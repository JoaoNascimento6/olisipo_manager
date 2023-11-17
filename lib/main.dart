import 'package:flutter/material.dart';
//import 'package:olisipo_manager/login/login.dart';
import 'package:olisipo_manager/registo/registo.dart';
//import 'package:olisipo_manager/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: registoPage(), // Include this line
        ),
      ),
    );
  }
}
