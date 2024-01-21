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
  String nome = '';
  List<(String, String,String)> ferias = [];
  List<(String, String)> ajudas = [];
  List<(String, String)> despesas = [];
  List<(String, String)> horas = [];
  List<(String, String, String)> reunioes = [];

  void onTipoSelecionado(String tipo) {
    setState(() {
      tipoSelecionado = tipo;
    });
    print('Tipo de Noticia atualizado para: $tipoSelecionado');
  }

  Future<void> infosSubmissoes() async {
    ferias = await bd.MostrarFerias();
    ajudas = await bd.MostrarAjudas();
    despesas = await bd.MostrarDespesas();
    horas = await bd.MostrarHoras();
    reunioes = await bd.MostrarReunioes();
  }

  @override
  void initState() {
    super.initState();
    dados();
    _loadData();
  }

  void dados() async {
    var dados = await bd.MostrarPessoas();
    nome = dados.$1;
  }

  void _loadData() async {
    await infosSubmissoes();
    setState(() {
      // Update the state here if necessary
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Olisipo",
          style: TextStyle(
            fontSize: 30.0,
            color: Color(0xFF32D700),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
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
                          "Olá $nome!", // Use the 'nome' value here
                          style: TextStyle(fontSize: 18),
                        ),
                        Divider(
                          height: 30,
                          thickness: 3,
                          color: Color(0xFF32D700),
                        ),

                        Text(
                          "Notícias",
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),

                        // 2ª secção
                        SizedBox(
                          height: 70,
                          child: ListarTipoNoticias(
                            tiposDeNoticia: tipos,
                            onTipoSelecionado: onTipoSelecionado,
                          ),
                        ),
                        if (noticias.isNotEmpty)
                          CarrosselNoticias(noticias: noticias),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xFF32D700),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Estados das Submissões',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 320,
              child: EstadosPage(
                  ferias: ferias,
                  ajudasDeCusto: ajudas,
                  viaturaPropria: despesas,
                  reuniao: reunioes,
                  horas: horas),
            ),

          ],
        ),
      ),
    );
  }
}
