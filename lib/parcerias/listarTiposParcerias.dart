// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'metodoListarParcerias.dart';

class ListarTipoParcerias extends StatelessWidget {
  final List<String> tiposDeParceria;

  ListarTipoParcerias({
    required this.tiposDeParceria,
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
              '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: tiposDeParceria.map((tipo) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Adicione a lógica desejada ao selecionar um tipo de parceria
                      print('Tipo de Parceria selecionado: $tipo');
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
