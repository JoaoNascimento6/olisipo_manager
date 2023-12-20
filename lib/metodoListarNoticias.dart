import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/servidor.dart';
import 'dashboard.dart';

class ListarNoticias extends StatelessWidget {
  var se = Servidor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF32D700),
        title: Text('noticias'),
      ),
      body: FutureBuilder<
          List<(int, String, String, String, String, String, String)>>(
        future: se.listardashboardServer(),
        builder: (BuildContext context,
            AsyncSnapshot<
                    List<(int, String, String, String, String, String, String)>>
                snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            List<(int, String, String, String, String, String, String)>
                noticias = snapshot.data!;
            children = <Widget>[
              for (int i = 0; i < noticias.length; i += 3)
                SizedBox(
                  height: 160,
                  child: DashboardPage(
                    els: noticias.sublist(
                        i, i + 3 > noticias.length ? noticias.length : i + 3),
                  ),
                ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[Text('Erro ao carregar dados.')];
          } else {
            children = const <Widget>[CircularProgressIndicator()];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
