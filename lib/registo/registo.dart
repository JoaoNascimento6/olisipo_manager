// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/basededados.dart';

class RegistoPage extends StatelessWidget {
  RegistoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  var bd = Basededados();

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nomeController = TextEditingController();

  void insereRegisto() {
    bd.inserirvalor(
        nomeController.text, passwordController.text, emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olisipo Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              width: 343,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10), // Move 10 pixels to the right
                child: TextField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
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
                padding: const EdgeInsets.only(
                    left: 10), // Move 10 pixels to the right
                child: TextField(
                  controller: emailController,
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
                padding: const EdgeInsets.only(
                    left: 10), // Move 10 pixels to the right
                child: Stack(
                  children: [
                    TextField(
                      obscureText: true,
                      controller: passwordController,
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
              decoration: ShapeDecoration(
                color: Color(0xFF32D700),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: ElevatedButton(
                onPressed: insereRegisto,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF32D700), // Green color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded borders
                  ),
                ),
                child: const Text(
                  'Registar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
