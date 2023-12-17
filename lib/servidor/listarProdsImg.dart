import 'package:flutter/material.dart';
import '../servidor/servidor.dart';
import '../servidor/metodoListarUsers.dart';

class ListarProdsImg extends StatelessWidget {
  var se = Servidor();

  @override
  Widget build(BuildContext context) {
    se.url = "https://dummyjson.com/products";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('Consulta Utilizadores'),
      ),
      body: FutureBuilder<List<(String, String)>>(
        future: se.listaProdutosImg(),
        builder: (BuildContext context,
            AsyncSnapshot<List<(String, String)>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              SizedBox(height: 400, child: Meuwiw(els: snapshot.data!)),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[Text('Erro ao carregar dados.')];
          } else {
            children = const <Widget>[CircularProgressIndicator()];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
