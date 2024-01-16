// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'metodoListarNoticias.dart';

class ListarTipoNoticias extends StatelessWidget {
  final List<String> tiposDeNoticia;

  ListarTipoNoticias({
    required this.tiposDeNoticia,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Selecione um Tipo de Notícia:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: tiposDeNoticia.map((tipo) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Adicione a lógica desejada ao selecionar um tipo de notícia
                      print('Tipo de Notícia selecionado: $tipo');
                    },
                    child: Text(tipo),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
