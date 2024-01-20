import 'package:flutter/material.dart';

class EstadosPage extends StatelessWidget {

  final List<( String, String)> ferias;
  final List<( String, String)> ajudasDeCusto;
  final List<( String, String)> viaturaPropria;
  final List<( String, String)> horas;
  final List<( String, String,String)> reuniao;


  const EstadosPage({
    Key? key,
    required this.ferias,
    required this.ajudasDeCusto,
    required this.viaturaPropria,
    required this.reuniao,
    required this.horas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estados das Submissões'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          border: TableBorder.all(),
          children: [
            
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String title,
      {String? estado, bool isHeader = false}) {
    return TableRow(
      children: [
        Container(
          color: isHeader ? Colors.green : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(color: isHeader ? Colors.white : Colors.black),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(estado ?? ''),
            ),
          ),
        ),
      ],
    );
  }
}
