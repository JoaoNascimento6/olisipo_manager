// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:olisipo_manager/routes/routes.dart';
import './servidor/basededados.dart';
import './servidor/servidor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    var bd = Basededados();
    var se = Servidor();

    void criaTabela() {

      //bd.apagatabelaParcerias();
      //bd.CriarTabelaTipoParcerias();
      //bd.CriarTabelaParcerias();
      se.getDadosServidor();

    }

    criaTabela();
    return MaterialApp(
      title: 'Portal do Colabordor - Olisipo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(33, 150, 243, 1)),
        useMaterial3: true,
      ),
      //initialRoute: AppRoutes.RoutePrincipal,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
