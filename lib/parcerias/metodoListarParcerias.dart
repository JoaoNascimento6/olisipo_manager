import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/metodoListarUsers.dart';
import 'package:olisipo_manager/servidor/servidor.dart';

import 'parcerias.dart';

class ListarParcerias extends StatelessWidget {
  var se = Servidor();

  @override
  Widget build(BuildContext context) {
    se.url = "https://dummyjson.com/products";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF32D700), // Cor da barra verde
        title: Text('Parcerias'), // Texto no topo da barra verde
      ),
      body: FutureBuilder<List<(int, String, String)>>(
        future: se.listarParceriasServer(),
        builder: (BuildContext context,
            AsyncSnapshot<List<(int, String, String)>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            List<(int, String, String)> products = snapshot.data!;
            children = <Widget>[
              for (int i = 0; i < products.length; i += 3)
                SizedBox(
                  height: 160, // Ajuste a altura conforme necessário
                  child: ParceriasPage(els: products.sublist(i, i + 3)),
                ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[Text('Erro ao carregar dados.')];
          } else {
            children = const <Widget>[CircularProgressIndicator()];
          }
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),
          );
        },
      ),
    );
  }
}
