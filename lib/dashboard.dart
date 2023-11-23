import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
                Text("Olisipo",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
            Row(
              children: [],
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/Image Block.png",
                  width: 297,
                  height: 211,
                ),
                Text("Notícias",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    )),
                Text("Olá Carlos!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                Stack(
                  children: [
                    Image.asset(
                      "assets/Image Block.png",
                      width: 62,
                      height: 211,
                    )
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(
                      "assets/Image Block.png",
                      width: 62,
                      height: 211,
                    )
                  ],
                ),
                Text("8m ago",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )),
                Text("Noticia nº1",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                Text(
                    "He'll want to use your yacht, and I don't want this thing smelling   like fish...",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
                Stack(
                  children: [
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
                    Text("Pesquisar",
                        style: TextStyle(
                          fontSize: 10.075801849365234,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(
                      "assets/BG.png",
                      width: 48,
                      height: 23,
                    ),
                    Image.asset(
                      "assets/BG.png",
                      width: 58,
                      height: 23,
                    ),
                    Image.asset(
                      "assets/BG.png",
                      width: 58,
                      height: 23,
                    ),
                    Image.asset(
                      "assets/BG.png",
                      width: 105,
                      height: 23,
                    ),
                    Image.asset(
                      "assets/BG.png",
                      width: 27,
                      height: 23,
                    ),
                    Text("Cursos",
                        style: TextStyle(
                          fontSize: 9.284126281738281,
                          fontWeight: FontWeight.w600,
                        )),
                    Text("Inovação",
                        style: TextStyle(
                          fontSize: 9.284126281738281,
                          fontWeight: FontWeight.w600,
                        )),
                    Text("Formação",
                        style: TextStyle(
                          fontSize: 9.284126281738281,
                          fontWeight: FontWeight.w600,
                        )),
                    Text("Inteligência Artificial",
                        style: TextStyle(
                          fontSize: 9.284126281738281,
                          fontWeight: FontWeight.w600,
                        )),
                    Text("RH",
                        style: TextStyle(
                          fontSize: 9.284126281738281,
                          fontWeight: FontWeight.w600,
                        ))
                  ],
                )
              ],
            ),
            Image.asset(
              "assets/Ellipse 1.png",
              width: 8,
              height: 8,
            ),
            Image.asset(
              "assets/Ellipse 2.png",
              width: 8,
              height: 8,
            ),
            Image.asset(
              "assets/Ellipse 3.png",
              width: 8,
              height: 8,
            ),
            Row(
              children: [],
            ),
            Container(
              width: 342,
              height: 0,
            ),
            Stack(
              children: [
                Container(
                  width: 343,
                  height: 217,
                ),
                Container(
                  width: 343,
                  height: 40,
                ),
                Container(
                  width: 342,
                  height: 0,
                ),
                Container(
                  width: 342,
                  height: 0,
                ),
                Container(
                  width: 342,
                  height: 0,
                ),
                Text("Estado das Submissões",
                    style: TextStyle(
                      fontSize: 16.49831771850586,
                      fontWeight: FontWeight.w600,
                    )),
                Text("Férias - 07/01 | 14/01",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    )),
                Text("Ajudas de Custo - 11/08 ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    )),
                Text("Viatura Própria - 22/12",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    )),
                Text("Reunião - 02/01",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    )),
                Text("Por Validar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                Text("Recusado",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                Text("Aceite",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                Text("Por Validar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))
              ],
            )
          ],
        ));
  }
}
