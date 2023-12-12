// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class AjudasCustoPage extends StatefulWidget {
  const AjudasCustoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AjudasCustoPage> createState() => _AjudasCustoPageState();
}

class _AjudasCustoPageState extends State<AjudasCustoPage> {
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
                left: 0,
                top: 0,
                child: Container(
                  width: 375,
                  height: 140,
                  decoration: BoxDecoration(color: Color(0xFF32D700)),
                ),
              ),
              Positioned(
                left: 28,
                top: 168,
                child: Text(
                  'Envie os custos que teve durante o horário de trabalho\ne a fatura como comprovativo ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 100,
                top: 669,
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
                        'Enviar',
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
              Positioned(
                left: 335,
                top: 73,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(3.14),
                  child: Container(
                    width: 296,
                    height: 43,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(3.14),
                          child: Text(
                            'Viatura Própria',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFC1C1C1),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(3.14),
                          child: Text(
                            'Ajudas de Custo',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF32D700),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 21,
                top: 216,
                child: Container(
                  width: 326,
                  height: 345,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 18,
                        top: 124,
                        child: Text(
                          'Escreva um descritivo para o custo...',
                          style: TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        top: 39,
                        child: Text(
                          'Escreva o valor gasto...',
                          style: TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 85,
                        child: Text(
                          'Descritivo',
                          style: TextStyle(
                            color: Color(0xFF727272),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 301,
                        child: Text(
                          'Fatura',
                          style: TextStyle(
                            color: Color(0xFF727272),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 328,
                        child: Text(
                          'Upload da Fatura',
                          style: TextStyle(
                            color: Color(0xFF727272),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 65,
                        top: 295,
                        child: Container(
                          width: 25,
                          height: 25,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 0,
                        child: Text(
                          'Valor',
                          style: TextStyle(
                            color: Color(0xFF727272),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
