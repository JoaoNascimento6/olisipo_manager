import 'package:flutter/material.dart';
import 'ajudasCusto.dart';
import 'viaturaPropria.dart';

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class TabBarGestaoCustos extends StatelessWidget {
  const TabBarGestaoCustos({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF32D700),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Viatura Própria',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  'Ajudas de Custo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            ViaturaPropriaPage(title: 'Despesas'),
            AjudasCustoPage(title: 'Ajudas de Custo'),
          ],
        ),
      ),
    );
  }
}
