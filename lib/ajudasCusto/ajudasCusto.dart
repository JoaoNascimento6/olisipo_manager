// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '../servidor/servidor.dart';

class AjudasCustoPage extends StatefulWidget {
  const AjudasCustoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AjudasCustoPage> createState() => _AjudasCustoPageState();
}

class _AjudasCustoPageState extends State<AjudasCustoPage> {
  final TextEditingController valorController = TextEditingController();
  final TextEditingController descritivoController = TextEditingController();
  final TextEditingController faturaController = TextEditingController();
  String? filePath;

  var se = Servidor();

  @override
  void dispose() {
    valorController.dispose();
    descritivoController.dispose();
    faturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: 812,
        child: Stack(
          children: [
            Positioned(
              left: 25,
              top: 30,
              child: Text(
                'Envie os custos que teve durante o horário de trabalho\ne a fatura como comprovativo ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 70,
              child: Container(
                width: screenWidth - 50,
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valor (€)',
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 101, 101),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(153, 238, 238, 238),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          controller: valorController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Escreva o valor gasto...',
                            hintStyle: TextStyle(
                              color: const Color(0xFFBDBDBD),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Descritivo',
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 101, 101),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(153, 238, 238, 238),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextFormField(
                          controller: descritivoController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Escreva um descritivo para o custo...',
                            hintStyle: TextStyle(
                              color: const Color(0xFFBDBDBD),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Fatura',
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 101, 101),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Selecionar Fatura'),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Positioned(
                  left: 25,
                  top: 480,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!valorController.text.isNotEmpty ||
                          !descritivoController.text.isNotEmpty) {
                        final snackBar = SnackBar(
                          content:
                              Text('Preencha todos os campos antes de enviar.'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }

                      try {
                        await se.inserirAjudaCusto(
                          await se.obterTokenLocalmente(),
                          double.parse(valorController.text),
                          descritivoController.text,
                          //faturaController.text, meter a fatura a ir buscar um ficheiro ou a tirar foto
                          'fatura.pdf',
                          false,
                        );
                      } catch (e) {
                        print('Erro ao enviar ajudas de custo: $e');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Erro ao enviar Ajudas de Custo!'),
                              content: Text(
                                'Dados inválidos para a submissão de ajudas de custo.',
                                style: TextStyle(fontSize: 17),
                              ),
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
                      width: MediaQuery.of(context).size.width - 60,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xFF32D700),
                      ),
                      child: Center(
                        child: Text(
                          'Enviar',
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
