// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:olisipo_manager/RoutePrincipal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(33, 150, 243, 1)),
        useMaterial3: true,
      ),
      home: const Routeprincipal(title: 'Olisipo Manager'),
    );
  }
}
