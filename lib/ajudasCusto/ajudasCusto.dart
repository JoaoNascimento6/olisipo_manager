// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AjudasCustoPage extends StatefulWidget {
  const AjudasCustoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AjudasCustoPage> createState() => _AjudasCustoPageState();
}

class _AjudasCustoPageState extends State<AjudasCustoPage> {
  final TextEditingController valorController = TextEditingController();
  final TextEditingController descritivoController = TextEditingController();
  final TextEditingController faturaController = TextEditingController();
  String? filePath;

  Future<void> _tirarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        filePath = pickedFile.path;
      });
      // filePath contém o caminho da imagem tirada, você pode usá-lo para exibir ou enviar a imagem posteriormente
    }
  }

  @override
  void dispose() {
    valorController.dispose();
    descritivoController.dispose();
    faturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
              left: 25,
              top: 30,
              child: Text(
                'Envie os custos que teve durante o horário de trabalho\ne a fatura como comprovativo ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 70,
              child: Container(
                width: screenWidth - 50,
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valor',
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 101, 101),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(153, 238, 238, 238),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          controller: valorController,
                          decoration: InputDecoration(
                            hintText: 'Escreva o valor gasto...',
                            hintStyle: TextStyle(
                              color: const Color(0xFFBDBDBD),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Descritivo',
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 101, 101),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(153, 238, 238, 238),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextFormField(
                          controller: descritivoController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Escreva um descritivo para o custo...',
                            hintStyle: TextStyle(
                              color: const Color(0xFFBDBDBD),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Fatura',
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 101, 101),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _tirarFoto();
                      },
                      child: Text('Tirar Foto da Fatura'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 480,
              child: Container(
                width: screenWidth - 60,
                height: 55,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: ShapeDecoration(
                  color: const Color(0xFF32D700),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
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
