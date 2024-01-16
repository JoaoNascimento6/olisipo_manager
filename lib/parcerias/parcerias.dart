// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/basededados.dart';
import 'metodoListarParcerias.dart';
import 'listarTiposParcerias.dart';


class ParceriasPage extends StatelessWidget {
  var bd = Basededados();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF32D700),
        title: Text('Parcerias'),
      ),
      body: FutureBuilder<
          (List<(String, String, String, String, String)>, List<String>)>(
        future: bd.MostrarParcerias(),
        builder: (BuildContext context,
            AsyncSnapshot<
                    (
                      List<(String, String, String, String, String)>,
                      List<String>
                    )>
                snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            var (parcerias, tipos) = snapshot.data!;
            // List<(int, String, String, String, String, String)> parcerias =
            //     snapshot.data!;
            children = <Widget>[
              SizedBox(
                height: 160,
                child: ListarTipoParcerias(
                  tiposDeParceria: tipos,
                ),
              ),

              //--------------------------
              for (int i = 0; i < parcerias.length; i += 3)
                SizedBox(
                  height: 160,
                  child: ListarParcerias(
                    els: parcerias.sublist(
                        i, i + 3 > parcerias.length ? parcerias.length : i + 3),
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
