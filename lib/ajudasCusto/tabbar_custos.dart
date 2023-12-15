import 'package:flutter/material.dart';
import 'ajudasCusto.dart';
import 'viaturaPropria.dart';

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF32D700),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp, color: Colors.white),
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
