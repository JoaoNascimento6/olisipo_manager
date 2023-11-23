// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class RegistoPage extends StatefulWidget {
  const RegistoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RegistoPage> createState() => _RegistoPageState();
}

class _RegistoPageState extends State<RegistoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olisipo Manager'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                width: 343,
                height: 50,
              ),
              Text(
                "Nome",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 343,
                height: 50,
              ),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 343,
                height: 50,
              ),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Mostrar",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Criar Conta",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            "Esqueceu a sua password?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Column(
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Criar Conta",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: 16.60012435913086,
                    height: 0,
                  ),
                  Container(
                    width: 16.60012435913086,
                    height: 0,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
