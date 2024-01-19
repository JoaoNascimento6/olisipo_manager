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
    return Scaffold(
      appBar: AppBar(
        title: Text("Redefinir Senha"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Código de confirmação:"),
            TextField(
              controller: _codeController,
            ),
            Text("Nova senha:"),
            TextField(
              controller: _passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // Verifica se o código de confirmação está correto.
                String code = _codeController.text;
                if (code != widget.code) {
                  // O código de confirmação está incorreto.
                  return;
                }

                // Atualiza a senha no servidor.
                // ...
                se.updatePasswordporEmail(widget.email, _passwordController.text);
                print(_passwordController.text);

                // Redireciona o usuário para a página de login.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(title: []), // Substitua LoginPage pela sua página de login
                  ),
                );
              },
              child: Text("Redefinir Senha"),
            ),
          ],
        ),
      ),
    );
  }
}
