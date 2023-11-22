// ignore_for_file: unused_import, prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:olisipo_manager/login/login.dart';

class Routeprincipal extends StatefulWidget {
  const Routeprincipal({super.key, required this.title});

  final String title;

  @override
  State<Routeprincipal> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Routeprincipal> {
  /*var bd = Basededados();

  void consulta_registo() {
    bd.consulta();
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(33, 150, 243, 1),
              ),
              child: Text('Olisipo'),
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(title: 'LoginPage')),
                );
              },
            ),
          ],
        ),
      ),
    ); //body: Meuwiw(els: ['1', '2', '3', '45555']));
  }
}
