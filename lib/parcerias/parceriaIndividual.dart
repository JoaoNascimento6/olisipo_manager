// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class ParceriaIndividualPage extends StatefulWidget {
  const ParceriaIndividualPage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<ParceriaIndividualPage> createState() => _ParceriaIndividualPageState();
}

class _ParceriaIndividualPageState extends State<ParceriaIndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olisipo Manager'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Text(
                "FitnessUP",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: [
              // Adicione seus widgets aqui conforme necessário
            ],
          ),
          Image.asset(
            "assets/Image Block.png",
            width: 297,
            height: 211,
          ),
          Text(
            "Lorem sunt magna et consequat\n\n"
            "Nisi id ipsum irure aute. Deserunt sit aute irure quis nulla eu consequat fugiat Lorem sunt magna et consequat labore. Laboris incididunt id Lorem est duis deserunt nisi dolore eiusmod culpa exercitation consectetur.\n\n"
            "Benefícios:\n\n"
            "Laboris incididunt id Lorem est duis deserunt nisi dolore eiusmod culpa exercitation consectetur.\n\n"
            "Laboris incididunt id Lorem est duis deserunt nisi dolore eiusmod culpa exercitation consectetur.\n\n"
            "Laboris incididunt id Lorem est duis deserunt nisi dolore eiusmod culpa exercitation consectetur.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: 375,
            height: 43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x00d9d9d9), Color(0x99000000)],
              ),
            ),
          ),
          Image.asset(
            "assets/Back.png",
            width: 22.000001907348633,
            height: 25.999998092651367,
          ),
          Row(
            children: [
              // Adicione seus widgets aqui conforme necessário
            ],
          ),
        ],
      ),
    );
  }
}
