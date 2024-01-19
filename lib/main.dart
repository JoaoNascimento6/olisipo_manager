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

    void servidor_basedados() {
      /*bd.apagatabelaParcerias();
      bd.CriarTabelaAjudas();
      bd.CriarTabelaDespesas();
      bd.CriarTabelaFerias();
      bd.CriarTabelaHoras();
      bd.CriarTabelaNoticias();
      bd.CriarTabelaTipoNoticia();
      bd.CriarTabelaTipoParcerias();
      bd.CriarTabelaParcerias();
      bd.CriarTabelaRecibos();
      bd.CriarTabelaReunioes();
      bd.CriarTabelaPessoas();
      bd.CriarTabelaPessoas();
      bd.CriarTabelaInfos();*/
      //se.getDadosServidor();
    }

    servidor_basedados();

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
