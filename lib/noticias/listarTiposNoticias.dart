// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'metodoListarNoticias.dart';

class ListarTipoNoticias extends StatelessWidget {
  final List<String> tiposDeNoticia;
  final Function(String) onTipoSelecionado;

  ListarTipoNoticias({
    required this.tiposDeNoticia,
    required this.onTipoSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: tiposDeNoticia.map((tipo) {
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
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
