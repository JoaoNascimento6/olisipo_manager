import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../servidor/basededados.dart';
import 'pdf_recibos.dart';

class ReciboPage extends StatefulWidget {
  ReciboPage({Key? key}) : super(key: key);

  @override
  ReciboPageState createState() => ReciboPageState();
}

class ReciboPageState extends State<ReciboPage> {
  final bd = Basededados();
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  void showModalRecibosVencimento(
    BuildContext context,
    String name,
    String email,
  ) {
    Future<void> _downloadComprovativo(
        int selectedMonth, int selectedYear) async {
      // Lógica para construir a URL do comprovativo
      String url = await bd.MostrarRecibo(selectedMonth, selectedYear);

      // Lógica para iniciar o download
      //_launchURL(url);
    }

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
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
                          if (newValue != null) {
                            setState(() {
                              selectedMonth = newValue;
                            });
                          }
                        },
                        items: List.generate(12, (index) {
                          return DropdownMenuItem<int>(
                            value: index + 1,
                            child: Text('${index + 1}'),
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
                          if (newValue != null) {
                            setState(() {
                              selectedYear = newValue;
                            });
                          }
                        },
                        items: List.generate(10, (index) {
                          return DropdownMenuItem<int>(
                            value: DateTime.now().year + index,
                            child: Text('${DateTime.now().year + index}'),
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
                    String monthName = DateFormat('MMMM', 'pt_BR')
                        .format(DateTime(selectedYear, selectedMonth));
                    PDFrecibos(name, email, monthName, selectedYear);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    alignment: Alignment.centerLeft,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(Icons.download, color: Colors.green),
                        SizedBox(width: 8),
                        Text(
                          'Download do Comprovativo',
                          style: TextStyle(color: Colors.green, fontSize: 16),
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
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
