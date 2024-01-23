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
                        onTipoSelecionado('');
                      } else {
                        onTipoSelecionado(tipo);
                      }
                    },
                    child: Text(
                      tipo,
                      style: TextStyle(color: Color(0xFF32D700)),
                    ),
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
