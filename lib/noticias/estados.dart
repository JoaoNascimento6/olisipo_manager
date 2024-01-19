import 'package:flutter/material.dart';

class EstadosPage extends StatelessWidget {
  final String ferias;
  final String ajudasDeCusto;
  final String viaturaPropria;
  final String reuniao;

  const EstadosPage({
    Key? key,
    required this.ferias,
    required this.ajudasDeCusto,
    required this.viaturaPropria,
    required this.reuniao,
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
            _buildTableRow('Estados das Submissões', isHeader: true),
            _buildTableRow('Férias', estado: ferias),
            _buildTableRow('Ajudas de Custo', estado: ajudasDeCusto),
            _buildTableRow('Viatura Própria', estado: viaturaPropria),
            _buildTableRow('Reunião', estado: reuniao),
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
