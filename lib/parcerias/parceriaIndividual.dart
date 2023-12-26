import 'package:flutter/material.dart';

class DetalhesParceriaPage extends StatelessWidget {
  final int id;
  final String imagem;
  final String descricao;
  final String nome;
  final String beneficios;
  final String tipo;
  final bool publicada;

  DetalhesParceriaPage({
    required this.id,
    required this.imagem,
    required this.nome,
    required this.beneficios,
    required this.descricao,
    required this.tipo,
    required this.publicada,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nome,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        toolbarHeight: 100.0,
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imagem,
                      height: 250,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Descrição:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      descricao,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Benefícios:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Mapeia cada parágrafo de benefícios
                  ...beneficios
                      .split('. ')
                      .map((paragraph) => Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              '• $paragraph',
                              style: TextStyle(fontSize: 16),
                            ),
                          ))
                      .toList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
