// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'metodoListarParcerias.dart';

class ListarTipoParcerias extends StatelessWidget {
  final List<String> tiposDeParceria;
  final Function(String) onTipoSelecionado;

  ListarTipoParcerias({
    required this.tiposDeParceria,
    required this.onTipoSelecionado,
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
                      if (tipo == 'Todas') {
                        onTipoSelecionado(''); // Seleciona "Todas"
                      } else {
                        onTipoSelecionado(tipo);
                      }
                      // Adicione a lógica desejada ao selecionar um tipo de parceria
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
