import 'package:flutter/material.dart';

class DetalhesNoticiaPage extends StatelessWidget {
  final String imagem;
  final String titulo;
  final String subtitulo;
  final String corpo;
  final String tipo;

  DetalhesNoticiaPage({
    required this.imagem,
    required this.titulo,
    required this.subtitulo,
    required this.corpo,
    required this.tipo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titulo,
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
                      subtitulo,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      corpo,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
