// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class ParceriasPage extends StatefulWidget {
  const ParceriasPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ParceriasPage> createState() => _ParceriasPageState();
}

class _ParceriasPageState extends State<ParceriasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Olisipo Manager'),
        ),
        body: Column(
          children: [
            Container(
              width: 375,
              height: 140,
              decoration: BoxDecoration(
                color: Color(0xff32d700),
              ),
            ),
            Column(
              children: [
                Text(
                  "Parcerias",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            for (var partnership in [
              "Vodafone",
              "FitnessUP",
              "Portugália",
              "CUF",
              "Adidas",
              "Nike"
            ])
              Stack(
                children: [
                  Image.asset(
                    "assets/unnamed 1.png",
                    width: 94,
                    height: 94,
                  ),
                  Container(
                    width: 94,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x00d9d9d9), Colors.black],
                      ),
                    ),
                  ),
                  Text(
                    partnership,
                    style: TextStyle(
                      fontSize: 15.669642448425293,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            Row(
              children: [],
            ),
            Image.asset(
              "assets/BG.png",
              width: 126,
              height: 31,
            ),
            Image.asset(
              "assets/control 2.png",
              width: 19,
              height: 19,
            ),
            Text(
              "Pesquisar",
              style: TextStyle(
                fontSize: 10.075801849365234,
                fontWeight: FontWeight.w500,
              ),
            ),
            Stack(
              children: [
                for (var category in [
                  "Desporto",
                  "Telecomunicações",
                  "Saúde",
                  "Alimentação"
                ])
                  Row(
                    children: [
                      Image.asset(
                        "assets/BG.png",
                        width: 60,
                        height: 23,
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 9.284126281738281,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ));
  }
}
