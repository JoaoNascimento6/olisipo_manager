import 'package:flutter/material.dart';
import '../servidor/servidor.dart';
import '../servidor/basededados.dart';
import './informacaoprofissional.dart';

class CurriculumPage extends StatefulWidget {
  const CurriculumPage({Key? key, required this.title, required this.dados})
      : super(key: key);

  final String title;
  final (
    String,
    String,
    String,
    String,
    List<(String, String, String, String)>
  ) dados;

  @override
  State<CurriculumPage> createState() => _CurriculumPageState();
}

class _CurriculumPageState extends State<CurriculumPage> {
  var se = Servidor();
  var bd = Basededados();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: screenWidth * 0.9,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
                                'Curriculo',
                                style: TextStyle(
                                  color: Color(0xFF727272),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Faz o upload do teu currículo:',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Lógica para o botão de upload
                                    },
                                    icon: Icon(Icons.upload),
                                    color: Color(0xFF32D700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Informações Profissionais',
                              style: const TextStyle(
                                color: Color(0xFF727272),
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            InformacaoProfissionalPage()
                                .showModalInfoProfissional(context);
                          },
                          child:
                              Icon(Icons.add, color: const Color(0xFF32D700)),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var infoProfissional in widget.dados.$5)
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.green,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 3),
                                  SizedBox(
                                    width: screenWidth - 50,
                                    child: Text(
                                      infoProfissional.$1,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  SizedBox(
                                    width: screenWidth - 50,
                                    child: Text(
                                      infoProfissional.$2,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    infoProfissional.$4,
                                    style: TextStyle(
                                      color: Color(0xFF727272),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Container(
                                    width: screenWidth - 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton.icon(
                                          onPressed: () {
                                            // Adicione a lógica para o botão de download
                                          },
                                          icon: Icon(
                                            Icons.download,
                                            color: Color(0xFF32D700),
                                          ),
                                          label: Text(
                                            infoProfissional.$3,
                                            style: TextStyle(
                                              color: Color(0xFF32D700),
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                        TextButton.icon(
                                          onPressed: () async {
                                            bd.apagarInformacaoProfissional(
                                                infoProfissional.$1);
                                            await se
                                                .eliminarInformacaoProfissional(
                                                    await se
                                                        .obterTokenLocalmente(),
                                                    infoProfissional.$1);
                                            setState(() {
                                              widget.dados.$5
                                                  .remove(infoProfissional);
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Informação Profissional eliminada com sucesso!'),
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          label: Text(''),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
