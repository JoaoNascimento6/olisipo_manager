// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EstadosPage extends StatelessWidget {
  const EstadosPage({
    Key? key,
    required this.ferias,
    required this.ajudasDeCusto,
    required this.viaturaPropria,
    required this.reuniao,
    required this.horas,
  }) : super(key: key);

  final List<(String, String, String)> ferias;
  final List<(String, String)> ajudasDeCusto;
  final List<(String, String)> viaturaPropria;
  final List<(String, String)> horas;
  final List<(String, String, String)> reuniao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 5),
          _buildListTextFerias('Férias', ferias),
          _buildDivider(),
          _buildListText('Ajudas de Custo', ajudasDeCusto),
          _buildDivider(),
          _buildListText('Viatura Própria', viaturaPropria),
          _buildDivider(),
          _buildListText('Horas', horas),
          _buildDivider(),
          _buildListTextWithThreeItems('Reunião', reuniao),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 30,
      thickness: 1,
      color: Color(0xFF32D700),
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _buildListText(String title, List<(String, String)> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
          child: ListView.builder(
            padding: EdgeInsets.all(2.0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$title - ${item.$2}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '${item.$1}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildListTextWithThreeItems(
      String title, List<(String, String, String)> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 1.0),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              String status = item.$1 == 'null'
                  ? 'Pendente'
                  : item.$1.toLowerCase() == 'true'
                      ? 'Aceite'
                      : 'Rejeitado';
              String valor3Formatted = item.$3.substring(0, item.$3.length - 3);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$title - ${item.$2} $valor3Formatted',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '$status',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildListTextFerias(
      String title, List<(String, String, String)> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 1.0),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$title - ${item.$2} ${item.$3}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '${item.$1}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
