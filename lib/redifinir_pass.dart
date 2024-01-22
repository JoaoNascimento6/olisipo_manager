import 'package:flutter/material.dart';
import 'package:olisipo_manager/login.dart';
import 'servidor/servidor.dart';
import 'login.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;
  final String code;

  ResetPasswordPage({
    required this.email,
    required this.code,
  });

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  var se = Servidor();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              Image.asset(
                'images/olisipo.png',
                width: 250,
              ),
              SizedBox(height: 70),
              Text(
                'Redefinir a sua Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: screenWidth - 150,
                child: Text(
                  'Insira o código de segurança e redifina a sua password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 343,
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: _codeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Código de confirmação',
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
              Container(
                width: 343,
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Nova Password',
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
              ElevatedButton(
                onPressed: () {
                  String code = _codeController.text;
                  String newPassword = _passwordController.text;
                  if (code.isEmpty || newPassword.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Por favor, preencha todos os campos.'),
                      ),
                    );
                    return;
                  }
                  if (code != widget.code) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Código de confirmação incorreto.'),
                      ),
                    );
                    return;
                  }

                  se.updatePasswordporEmail(widget.email, newPassword);
                  print(newPassword);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(title: []),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Ink(
                  width: screenWidth - 140,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xFF32D700),
                  ),
                  child: Center(
                    child: Text(
                      'Redefinir Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
