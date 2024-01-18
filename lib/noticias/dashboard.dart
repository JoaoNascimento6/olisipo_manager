import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/basededados.dart';
import 'metodoListarNoticias.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var bd = Basededados();
  String tipoSelecionado =
      'Todos'; // Inicializa com 'Todos' para mostrar todas as notícias

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Olisipo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<
            (List<(String, String, String, String, String)>, List<String>)>(
          future: bd.MostrarNoticias(),
          builder: (BuildContext context,
              AsyncSnapshot<
                      (
                        List<(String, String, String, String, String)>,
                        List<String>
                      )>
                  snapshot) {
            if (snapshot.hasData) {
              var (noticias, tipos) = snapshot.data!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1ª secção
                  Text(
                    "Olá Carlos!",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Center(
                    child: Text(
                      "",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // 2ª secção
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        Text(
                          "Notícias",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        _buildTipoButtons(tipos),
                      ],
                    ),
                  ),

                  // Utiliza o CarrosselNoticias aqui

                  CarrosselNoticias(
                    noticias: tipoSelecionado == 'Todos'
                        ? noticias
                        : noticias
                            .where((noticia) => noticia.$5 == tipoSelecionado)
                            .toList(),
                  ),

                  // 3ª secção
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Estado das Submissões",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildRow("Texto 1", "Direita 1"),
                  _buildRow("Texto 2", "Direita 2"),
                  _buildRow("Texto 3", "Direita 3"),
                  _buildRow("Texto 4", "Direita 4"),
                  _buildRow("Texto 5", "Direita 5"),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar dados.'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildTipoButtons(List<String> tipos) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              tipoSelecionado = 'Todos';
            });
          },
          child: Text('Todos'),
        ),
        for (var tipo in tipos)
          ElevatedButton(
            onPressed: () {
              setState(() {
                tipoSelecionado = tipo;
              });
            },
            child: Text(tipo),
          ),
      ],
    );
  }

  Widget _buildRow(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leftText),
        Text(rightText),
      ],
    );
  }
}
