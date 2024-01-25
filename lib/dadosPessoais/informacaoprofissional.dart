import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../servidor/servidor.dart';
import 'curriculum.dart';
import '../servidor/basededados.dart';

class InformacaoProfissionalPage extends StatelessWidget {
  final Servidor se = Servidor();
  var bd = Basededados();

  InformacaoProfissionalPage({Key? key}) : super(key: key);

  void showModalInfoProfissional(BuildContext context) {
    TextEditingController tituloController = TextEditingController();
    TextEditingController descricaoController = TextEditingController();
    TextEditingController tipoController = TextEditingController();
    TextEditingController documentoController = TextEditingController();

    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 1000,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Adicionar Informações',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: tituloController,
                  onTap: () {
                    if (tituloController.text == 'Insira o título') {
                      tituloController.clear();
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira o título',
                    labelText: 'Título',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: descricaoController,
                  onTap: () {
                    if (descricaoController.text == 'Insira a descrição') {
                      descricaoController.clear();
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira a descrição',
                    labelText: 'Descrição',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: tipoController,
                  onTap: () {
                    if (tipoController.text == 'Insira o tipo') {
                      tipoController.clear();
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira o tipo',
                    labelText: 'Tipo',
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para o botão de documento comprovativo
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        alignment: Alignment.centerLeft,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(Icons.upload, color: Colors.green),
                            SizedBox(width: 8),
                            Text(
                              'Documento Comprovativo',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () async {
                        if (!tituloController.text.isNotEmpty ||
                            !descricaoController.text.isNotEmpty ||
                            !tipoController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Container(
                                margin: EdgeInsets.only(bottom: 375.0),
                                child: Center(
                                  child: Text(
                                    'Preencha todos os campos antes de enviar.',
                                  ),
                                ),
                              ),
                            ),
                          );
                          return;
                        }
                        try {
                          await se.inserirInformacaoProfissional(
                            await se.obterTokenLocalmente(),
                            tituloController.text,
                            descricaoController.text,
                            'diploma.pdf',
                            tipoController.text,
                          );
                          await bd.InsertInfos([
                            (
                              tituloController.text,
                              descricaoController.text,
                              'diploma.pdf',
                              tipoController.text
                            ),
                          ]);

                          se.getDadosServidor();

                          tituloController.clear();
                          descricaoController.clear();
                          tipoController.clear();

                          Navigator.of(context).pop();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Informação Profissional adicionada com sucesso!'),
                            ),
                          );
                        } catch (e) {
                          print(
                              'Erro ao adicionar uma informação profissional: $e');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    'Erro ao adicionar uma Informação Profissional!'),
                                content: Text(
                                    'Dados inválidos para a informação profissional.',
                                    style: TextStyle(fontSize: 17)),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Ink(
                        width: screenWidth - 60,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFF32D700),
                        ),
                        child: Center(
                          child: Text(
                            'Adicionar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
