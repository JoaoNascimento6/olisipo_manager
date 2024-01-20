import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../servidor/basededados.dart';

class ReciboPage extends StatelessWidget {
  final bd = Basededados();

  ReciboPage({Key? key}) : super(key: key);

  void showModalRecibosVencimento(BuildContext context) {
    int selectedMonth = DateTime.now().month;
    int selectedYear = DateTime.now().year;

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
                            selectedMonth = newValue;
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
                            selectedYear = newValue;
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
