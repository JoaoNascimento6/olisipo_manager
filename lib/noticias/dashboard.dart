// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/basededados.dart';
import 'metodoListarNoticias.dart';
import 'estados.dart'; // Importa o arquivo com o widget EstadosPage
import 'listarTiposNoticias.dart'; // Importa o arquivo com o widget ListarTipoNoticias

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var bd = Basededados();
  String tipoSelecionado = '';

  void onTipoSelecionado(String tipo) {
    setState(() {
      tipoSelecionado = tipo;
    });
    print('Tipo de Noticia atualizado para: $tipoSelecionado');
  }

  void mostrarTodasNoticias() {
    setState(() {
      tipoSelecionado = '';
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Olisipo"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Mudei para start
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: FutureBuilder<
                    (
                      List<(String, String, String, String, String)>,
                      List<String>
                    )>(
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
                      //tipos.add('Todas');
                      print("chegou aqui");
                      print(tipos);
                      print(noticias);
                      tipos.insert(0, 'Todas');
                      if (tipoSelecionado != '') {
                        // Filtra as noticias com base no tipoSelecionado
                        noticias = noticias
                            .where((noticia) => noticia.$5 == tipoSelecionado)
                            .toList();
                      }

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
                          SizedBox(
                            height: 160,
                            child: ListarTipoNoticias(
                              tiposDeNoticia: tipos,
                              onTipoSelecionado: onTipoSelecionado,
                            ),
                          ),
                          CarrosselNoticias(noticias: noticias),
                          // 3ª secção
                         /*  Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Text(
                                  "Estado das Submissões",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Adiciona o widget EstadosPage aqui
                                EstadosPage(
                                  ferias: "Direita 1",
                                  ajudasDeCusto: "Direita 2",
                                  viaturaPropria: "Direita 3",
                                  reuniao: "Direita 4",
                                ),
                              ],
                            ),
                          ), */
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
            ],
          ),
        ),
      ),
    );
  }
}
