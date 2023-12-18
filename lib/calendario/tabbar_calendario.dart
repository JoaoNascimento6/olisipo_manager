import 'package:flutter/material.dart';
import 'horas.dart';
import 'ferias.dart';

class TabBarApp extends StatelessWidget {
  const TabBarApp({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class TabBarHorasFerias extends StatelessWidget {
  const TabBarHorasFerias({Key? key, required String title}) : super(key: key);

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
                  'Horas',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  'Férias',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HorasPage(title: 'Horas'),
            SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: FeriasPage(title: 'Férias'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
