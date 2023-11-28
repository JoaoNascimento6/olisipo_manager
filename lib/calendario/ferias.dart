import 'package:flutter/material.dart';

class FeriasPage extends StatefulWidget {
  const FeriasPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FeriasPage> createState() => _FeriasPageState();
}

class _FeriasPageState extends State<FeriasPage> {
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
                left: 40,
                top: 527,
                child: Container(
                  width: 164,
                  height: 68,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 164,
                          height: 68,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 164,
                                  height: 29,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Data de Começo:',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.27,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 32,
                                        child: Text(
                                          '07/01',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.61,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 7,
                                        height: 7,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF32D700),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                      Container(
                                        width: 39,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 0.83,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 175,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 0.83,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
                                              color: Color(0xFF32D700),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 39,
                                child: Container(
                                  width: 164,
                                  height: 29,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Data de Fim:',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.27,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 32,
                                        child: Text(
                                          '14/01',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.61,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 7,
                                        height: 7,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF32D700),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                      Container(
                                        width: 39,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 0.83,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 175,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 0.83,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
                                              color: Color(0xFF32D700),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                            'Horas',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFBDBDBD),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(3.14),
                          child: Text(
                            'Férias',
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
                        'Enviar Férias',
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
                left: 26,
                top: 159,
                child: Container(
                  width: 322,
                  height: 345,
                  decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ),
            ],
          ),
        ));
  }
}
