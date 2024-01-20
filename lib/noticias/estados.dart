import 'package:flutter/material.dart';
class EstadosPage extends StatelessWidget {
  final List<(String, String)> ferias;
  final List<(String, String)> ajudasDeCusto;
  final List<(String, String)> viaturaPropria;
  final List<(String, String)> horas;
  final List<(String, String, String)> reuniao;

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
      
    );
  }
}
