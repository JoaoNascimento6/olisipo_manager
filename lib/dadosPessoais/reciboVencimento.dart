// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class ReciboVencimentoPage extends StatefulWidget {
  const ReciboVencimentoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ReciboVencimentoPage> createState() => _ReciboVencimentoPageState();
}

class _ReciboVencimentoPageState extends State<ReciboVencimentoPage> {
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
                left: 47,
                top: 63,
                child: Container(
                  width: 281,
                  height: 31,
                  padding: const EdgeInsets.only(left: 12, right: 8, bottom: 9),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Gestão de Documentos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 769,
                child: Container(
                  width: 375,
                  height: 43,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color(0x00D9D9D9),
                        Colors.black.withOpacity(0.6000000238418579)
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 21,
                top: 138,
                child: Container(
                  height: 33,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 73,
                        top: 0,
                        child: Text(
                          'Recibos de Vencimento',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF727272),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 33,
                        child: Container(
                          width: 326,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFE7E7E7),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 246,
                child: Container(
                  width: 280,
                  height: 221,
                  decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ),
            ],
          ),
        ));
  }
}
