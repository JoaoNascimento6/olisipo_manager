import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/metodoListarUsers.dart';
import 'package:olisipo_manager/servidor/servidor.dart';

import 'parcerias.dart';

class ListarParcerias extends StatelessWidget {
  var se = Servidor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF32D700),
        title: Text('Parcerias'),
      ),
      body: FutureBuilder<List<(int, String, String, String, String)>>(
        future: se.listarParceriasServer(),
        builder: (BuildContext context,
            AsyncSnapshot<List<(int, String, String, String, String)>>
                snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            List<(int, String, String, String, String)> products =
                snapshot.data!;
            children = <Widget>[
              for (int i = 0; i < products.length; i += 3)
                SizedBox(
                  height: 160,
                  child: ParceriasPage(
                    els: products.sublist(
                        i, i + 3 > products.length ? products.length : i + 3),
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
