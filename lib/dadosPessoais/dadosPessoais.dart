import 'package:flutter/material.dart';

class DadosPessoaisPage extends StatefulWidget {
  const DadosPessoaisPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DadosPessoaisPage> createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState extends State<DadosPessoaisPage> {
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
                left: 44,
                top: 637,
                child: Container(
                  width: 287,
                  height: 32,
                  padding: const EdgeInsets.only(left: 3, bottom: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Gestão de Documentos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF353535),
                          fontSize: 25,
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
                left: 23,
                top: 679,
                child: Container(
                  width: 328,
                  height: 56,
                  padding: const EdgeInsets.all(20.99),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0C112692),
                        blurRadius: 11.37,
                        offset: Offset(0, 8.75),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Recibos de Vencimento',
                        style: TextStyle(
                          color: Color(0xFF696969),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 25),
                      Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Stack(children: []),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -1,
                top: 0,
                child: Container(
                  width: 376,
                  height: 201,
                  decoration: BoxDecoration(color: Color(0xFF32D700)),
                ),
              ),
              Positioned(
                left: 112,
                top: 67,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Perfil Olisipo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Container(
                        width: 129,
                        height: 129,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/129x129"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 5, color: Color(0x33AAFFB2)),
                            borderRadius: BorderRadius.circular(91),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3DFFFFFF),
                              blurRadius: 3,
                              offset: Offset(1, 1),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'Carlos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
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
                left: 18,
                top: 346,
                child: Container(
                  width: 328,
                  height: 269,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF6F6F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 294,
                top: 400,
                child: Text(
                  'Editar',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF32D700),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 294,
                top: 457,
                child: Text(
                  'Editar',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF32D700),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 288,
                top: 511,
                child: Text(
                  'Alterar',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF32D700),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 49,
                top: 377,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nome ',
                              style: TextStyle(
                                color: Color(0xFF727272),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'Carlos Medeiros',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                color: Color(0xFF727272),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'carlosmed_olisipo@olisipo.pt',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                color: Color(0xFF727272),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '**********',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nº Contribuinte',
                              style: TextStyle(
                                color: Color(0xFF727272),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            Container(
                              width: 328,
                              height: 56,
                              padding: const EdgeInsets.all(20.99),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x0C112692),
                                    blurRadius: 11.37,
                                    offset: Offset(0, 8.75),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Trabalhador Estudante ',
                                    style: TextStyle(
                                      color: Color(0xFF696969),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                ],
                              ),
                            ),
                            Container(
                              width: 328,
                              height: 56,
                              padding: const EdgeInsets.all(20.99),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x0C112692),
                                    blurRadius: 11.37,
                                    offset: Offset(0, 8.75),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Comprovativo Efetividade',
                                    style: TextStyle(
                                      color: Color(0xFF696969),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                ],
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '123456789',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 282,
                child: Container(
                  width: 296,
                  height: 43,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 191.06,
                        top: 13.83,
                        child: Text(
                          'Currículo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontSize: 13.83,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 23.33,
                        top: 13.83,
                        child: Text(
                          'Dados Pessoais',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF32D700),
                            fontSize: 13.83,
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
              Positioned(
                left: 16,
                top: 60,
                child: Container(
                  width: 343,
                  height: 36,
                  padding: const EdgeInsets.only(top: 8, left: 289, bottom: 9),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Logout',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
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
