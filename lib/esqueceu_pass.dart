import 'package:flutter/material.dart';
import './redifinir_pass.dart';
import 'dart:math';
import 'servidor/servidor.dart';


class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  late Random random;
  var se = Servidor();

  @override
  void initState() {
    super.initState();
    random = Random();
  }

  String generateConfirmationCode() {
    return random.nextInt(100000).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esqueceu a Senha?"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Insira seu e-mail:"),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            ElevatedButton(
              onPressed: () {
                // Envia um e-mail com um código de confirmação para o e-mail especificado.
                String email = _emailController.text;
                String code = generateConfirmationCode();

                print(code);
                // Envia um e-mail com o código de confirmação.
                // ...
                se.enviarEmail(email, code);

                // Redireciona o usuário para a página de redefinição de senha.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordPage(
                      email: email,
                      code: code,
                    ),
                  ),
                );
              },
              child: Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
