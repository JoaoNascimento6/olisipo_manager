// ignore_for_file: prefer_const_constructors
/*import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/basededados.dart';
import 'package:olisipo_manager/servidor/servidor.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.title});

  final List<(String, String)> title;

  var bd = Basededados();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  
  var se = Servidor();
  se.url = '';
  se.fazlogin(emailController,passwordController);

  Widget build(BuildContext context, int index) {
     
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Olisipo Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                onPressed: fazlogin,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF32D700), // Green color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded borders
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
        ),
      ),
    );
  }
}
