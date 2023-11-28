// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HorasPage extends StatefulWidget {
  const HorasPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HorasPage> createState() => _HorasPageState();
}

class _HorasPageState extends State<HorasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olisipo Manager'),
      ),
      body: Container(
        width: 375,
        height: 812,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 29,
              top: 180,
              child: Container(
                width: 322,
                height: 454,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 377,
                      child: Container(
                        width: 322,
                        height: 77,
                        decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 322,
                        height: 345,
                        decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                      ),
                    ),
                    Positioned(
                      left: 11,
                      top: 384,
                      child: Text(
                        'Parece que não tem as 8 horas de trabalho neste dia.                  Submeta a justificação das faltas.\n\nJustificação:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 375,
                height: 140,
                decoration: BoxDecoration(color: Color(0xFF32D700)),
              ),
            ),
            Positioned(
              left: 39,
              top: 73,
              child: Container(
                width: 296,
                height: 43,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Férias',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFBDBDBD),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Text(
                      'Horas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF32D700),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 100,
              top: 668,
              child: Container(
                height: 49,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: ShapeDecoration(
                  color: Color(0xFF32D700),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Enviar Horas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
