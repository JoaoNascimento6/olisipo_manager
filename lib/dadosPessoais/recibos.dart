import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../servidor/basededados.dart';
import 'pdf_recibos.dart';

class ReciboPage extends StatelessWidget {
  final bd = Basededados();

  ReciboPage({Key? key}) : super(key: key);

  void showModalRecibosVencimento(
      BuildContext context, String name, String contribuinte) {
    int selectedMonth = DateTime.now().month;
    int selectedYear = DateTime.now().year;
    initializeDateFormatting('pt_BR');

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 330,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Recibos de Vencimento',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Escolha o mês:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButton<int>(
                            value: selectedMonth,
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue != null) {
                                  selectedMonth = newValue;
                                }
                              });
                            },
                            items: List.generate(12, (index) {
                              return DropdownMenuItem<int>(
                                value: index + 1,
                                child: Text(DateFormat('MMMM', 'pt_BR')
                                    .format(DateTime(2022, index + 1))),
                              );
                            }),
                            hint: Text('Selecione o mês'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Escolha o ano:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButton<int>(
                            value: selectedYear,
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue != null) {
                                  selectedYear = newValue;
                                }
                              });
                            },
                            items: List.generate(14, (index) {
                              return DropdownMenuItem<int>(
                                value: DateTime.now().year - index,
                                child: Text('${DateTime.now().year - index}'),
                              );
                            }),
                            hint: Text('Selecione o ano'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        PDFrecibos(
                            name,
                            contribuinte,
                            DateFormat('MMMM', 'pt_BR')
                                .format(DateTime(selectedYear, selectedMonth)),
                            selectedYear);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        alignment: Alignment.centerLeft,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(Icons.download, color: Color(0xFF32D700)),
                            SizedBox(width: 8),
                            Text(
                              'Download do Comprovativo',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
