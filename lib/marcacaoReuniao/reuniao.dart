// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ReuniaoPage extends StatefulWidget {
  const ReuniaoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ReuniaoPage> createState() => _ReuniaoPageState();
}

class _ReuniaoPageState extends State<ReuniaoPage> {
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
              decoration: BoxDecoration(color: Color(0xff32d700))),
          Column(
            children: [
              Text("",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
          Container(
            height: 51,
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
            decoration: ShapeDecoration(
              color: Color(0xFF32D700),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: 328,
                height: 560,
              ),
              Container(
                width: 288,
                height: 64.72361755371094,
              ),
              Text("Escreva o motivo da reunião...",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  )),
              Stack(
                children: [
                  Column(
                    children: [
                      "Horário",
                      "Motivo",
                      "09:00",
                      "14:00",
                      "10:00",
                      "15:00",
                      "11:00",
                      "16:00",
                      "12:00",
                      "17:00",
                      "13:00",
                      "18:00"
                    ]
                        .map((text) => Text(
                              text,
                              style: TextStyle(
                                fontSize: 13.2720308303833,
                                fontWeight: FontWeight.w500,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: ["Dom.", "2ª", "3ª", "4ª", "5ª", "6ª", "Sáb."]
                .map((day) => Text(
                      day,
                      style: TextStyle(
                        fontSize: 11.61302661895752,
                        fontWeight: FontWeight.w400,
                      ),
                    ))
                .toList(),
          ),
          Column(
            children: [
              // Utilize um loop para criar os stacks de dias
              for (var i = 0; i < 7; i++)
                Stack(
                  children: [
                    Text(
                      (i + 1).toString(),
                      style: TextStyle(
                        fontSize: 11.61302661895752,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              Text(
                "Janeiro",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Image.asset(
                "assets/Back.png",
                width: 9.518181800842285,
                height: 11,
              ),
              Image.asset(
                "assets/Back.png",
                width: 9.518181800842285,
                height: 11,
              ),
              Column(
                children: [
                  Text(
                    "Marcar Reunião",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [],
          ),
          Container(
            width: 306,
            height: 251,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xfff6f6f6),
            ),
          ),
          Text(
            "Marcação de Reunião",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
