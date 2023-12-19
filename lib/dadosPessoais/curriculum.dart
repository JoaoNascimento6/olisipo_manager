import 'package:flutter/material.dart';
import '../servidor/servidor.dart';

class CurriculumPage extends StatefulWidget {
  const CurriculumPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CurriculumPage> createState() => _CurriculumPageState();
}

class _CurriculumPageState extends State<CurriculumPage> {
  var se = Servidor();

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
                            _showModalInfoProfissional(
                                context); // Função para abrir o showModalBottomSheet
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
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Estágio na Deloitte',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  'Desenvolvimento de websites na\nDeloitte',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  'Estágio',
                                  style: TextStyle(
                                    color: Color(0xFF727272),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                TextButton.icon(
                                  onPressed: () {
                                    // Adicione a lógica para o botão de download
                                  },
                                  icon: Icon(
                                    Icons.download,
                                    color: Color(0xFF32D700),
                                  ),
                                  label: Text(
                                    'Comprovativo',
                                    style: TextStyle(
                                      color: Color(0xFF32D700),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w300,
                                    ),
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

  void _showModalInfoProfissional(BuildContext context) {
    TextEditingController tituloController = TextEditingController();
    TextEditingController descricaoController = TextEditingController();
    TextEditingController tipoController = TextEditingController();

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 1000,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Adicionar Informações',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: tituloController,
                  onTap: () {
                    if (tituloController.text == 'Insira o título') {
                      tituloController.clear();
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira o título',
                    labelText: 'Título',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: descricaoController,
                  onTap: () {
                    if (descricaoController.text == 'Insira a descrição') {
                      descricaoController.clear();
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira a descrição',
                    labelText: 'Descrição',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: tipoController,
                  onTap: () {
                    if (tipoController.text == 'Insira o tipo') {
                      tipoController.clear();
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira o tipo',
                    labelText: 'Tipo',
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para o botão de documento comprovativo
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Cor de fundo branca
                        alignment: Alignment
                            .centerLeft, // Alinhar o conteúdo à esquerda
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(Icons.upload,
                                color: Colors.green), // Ícone verde
                            SizedBox(
                                width:
                                    8), // Espaçamento entre o ícone e o texto
                            Text(
                              'Documento Comprovativo',
                              style: TextStyle(
                                color: Colors.green, // Cor verde para o texto
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          se.inserirInformacaoProfissional(
                            1,
                            tituloController.text,
                            descricaoController.text,
                            'diploma.pdf',
                            tipoController.text,
                          );
                        } catch (e) {
                          print(
                              'Erro ao adicionar uma informação profissional: $e');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    'Erro ao adicionar uma informação profissional'),
                                content: Text(
                                    'Ocorreu um erro ao adicionar uma informação profissional.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text('Adicionar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF32D700), // Cor de fundo verde
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
