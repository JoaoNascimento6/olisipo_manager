import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/servidor.dart';
import 'metodoListarNoticias.dart';
import 'listarTiposNoticias.dart';

class DashboardPage extends StatelessWidget {
  var se = Servidor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF32D700),
        title: Text('Notícias'),
      ),
      body: FutureBuilder<
          (
            List<(int, String, String, String, String, String, String, bool)>,
            List<String>
          )>(
        future: se.listardashboardServer(),
        builder: (BuildContext context,
            AsyncSnapshot<
                    (
                      List<
                          (
                            int,
                            String,
                            String,
                            String,
                            String,
                            String,
                            String,
                            bool
                          )>,
                      List<String>
                    )>
                snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            var (noticias, tipos) = snapshot.data!;
            children = <Widget>[
              SizedBox(
                height: 160,
                child: ListarTipoNoticias(
                  tiposDeNoticia: tipos,
                ),
              ),
              for (int i = 0; i < noticias.length; i += 3)
                SizedBox(
                  height: 160,
                  child: ListarNoticias(
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
