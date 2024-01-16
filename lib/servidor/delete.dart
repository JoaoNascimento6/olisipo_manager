// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/basededados.dart';

class Delete extends StatelessWidget {
  var bd = Basededados();
  TextEditingController numeroController = TextEditingController();

  void deletePessoa(id) {
    //bd.deletePessoa(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Campo "Número"
          Row(
            children: <Widget>[
              Text("Número:"),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: numeroController,
                  keyboardType: TextInputType
                      .number, // Define o teclado para entrada de números
                  decoration: InputDecoration(
                    hintText: "Insira o id",
                  ),
                ),
              ),
            ],
          ),
          // Botão de envio
          ElevatedButton(
            onPressed: () {
              String numeroText = numeroController.text;
              int? numero = int.tryParse(numeroText);
              //bd.deletePessoa(numero);
            },
            child: Text("Escolha o id"),
          ),
        ],
      ),
    );
  }
}
