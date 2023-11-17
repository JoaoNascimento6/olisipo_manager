import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: registoPage(),
  ));
}

class registoPage extends StatelessWidget {
  const registoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Registo(),
          ],
        ),
      ),
    );
  }
}

class Registo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Text(
          "Nome",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Email",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        Column(
          children: [
            Text(
              "Password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              "Mostrar",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "Criar Conta",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Esqueceu a sua password?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        Column(
          children: [
            Text(
              "Login",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              "Criar Conta",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 16.6,
              height: 0,
            ),
          ],
        ),
      ],
    );
  }
}
