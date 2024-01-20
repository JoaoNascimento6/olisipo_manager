import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../servidor/servidor.dart';

class FaltasPage extends StatelessWidget {
  final Servidor se = Servidor();

  FaltasPage({Key? key}) : super(key: key);

  void showModalInfoProfissional(BuildContext context) {
    TextEditingController dataController = TextEditingController();
    TextEditingController horasController = TextEditingController();
    TextEditingController justificacaoController = TextEditingController();
    int horasFaltasValue = 0;

    var se = Servidor();

    Future<DateTime?> _selectDate(BuildContext context) async {
      DateTime currentDate = DateTime.now();
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(currentDate.year - 1),
        lastDate: DateTime(currentDate.year + 1),
      );
      return selectedDate;
    }

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;
        return SizedBox(
          height: 420,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Adicionar Faltas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: dataController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? selectedDate = await _selectDate(context);
                    if (selectedDate != null) {
                      dataController.text =
                          DateFormat('yyyy-MM-dd').format(selectedDate);
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Selecione a data',
                    labelText: 'Selecione a Data',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: horasController,
                  keyboardType: TextInputType.number,
                  onTap: () {
                    if (horasController.text == 'Insira as horas da falta') {
                      horasController.clear();
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira as horas faltadas',
                    labelText: 'Horas Faltadas',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: justificacaoController,
                  onTap: () {
                    if (justificacaoController.text ==
                        'Insira a justificação da falta') {
                      justificacaoController.clear();
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira a justificação da falta',
                    labelText: 'Justificação',
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (!horasController.text.isNotEmpty ||
                        !justificacaoController.text.isNotEmpty ||
                        !(horasFaltasValue?.toString()?.isNotEmpty ?? false)) {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Container(
                            margin: EdgeInsets.only(bottom: 350.0),
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
                      if (horasController.text.isNotEmpty) {
                        horasFaltasValue =
                            int.tryParse(horasController.text) ?? 0;

                        if (horasFaltasValue > 0) {
                          se.inserirFaltas(
                            await se.obterTokenLocalmente(),
                            dataController.text,
                            horasFaltasValue,
                            justificacaoController.text,
                            false,
                          );
                          print('Faltas inseridas com sucesso!');
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Faltas enviadas com sucesso!'),
                            ),
                          );
                        } else {
                          print('O campo de horas não é um valor válido.');
                        }
                      } else {
                        print('O campo de horas está vazio.');
                      }
                    } catch (e) {
                      print('Erro ao enviar horas: $e');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Erro ao enviar horas'),
                            content: Text(
                                'Ocorreu um erro ao enviar a submissão de horas.'),
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
