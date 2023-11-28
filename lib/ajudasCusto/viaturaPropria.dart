import 'package:flutter/material.dart';

class ViaturaPropriaPage extends StatefulWidget {
  const ViaturaPropriaPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ViaturaPropriaPage> createState() => _ViaturaPropriaPageState();
}

class _ViaturaPropriaPageState extends State<ViaturaPropriaPage> {
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
                  'Envie as despesas que teve com a sua viatura própria ',
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
                        'Ajudas de Custo',
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
                        'Viatura Própria',
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
                left: 21,
                top: 208,
                child: Container(
                  width: 326,
                  height: 325,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 18,
                        top: 124,
                        child: Text(
                          'Escreva o ponto de origem...',
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
                          'Escreva a quantidade de kilometro...',
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
                        top: 209,
                        child: Text(
                          'Escreva o ponto de chegada...',
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
                        top: 294,
                        child: Text(
                          'DD/MM/AAAA',
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
                          'Ponto de Origem',
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
                        top: 0,
                        child: Text(
                          'Kilometros',
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
                        top: 170,
                        child: Text(
                          'Ponto de Chegada',
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
                        top: 255,
                        child: Text(
                          'Data da Deslocação',
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
