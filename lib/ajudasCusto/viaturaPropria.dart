import 'package:flutter/material.dart';
import '../servidor/servidor.dart';

class ViaturaPropriaPage extends StatefulWidget {
  const ViaturaPropriaPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ViaturaPropriaPage> createState() => _ViaturaPropriaPageState();
}

class _ViaturaPropriaPageState extends State<ViaturaPropriaPage> {
  final TextEditingController kmController = TextEditingController();
  final TextEditingController porigemController = TextEditingController();
  final TextEditingController pchegadaController = TextEditingController();
  final TextEditingController dataController = TextEditingController();

  var se = Servidor();

  @override
  void dispose() {
    kmController.dispose();
    porigemController.dispose();
    pchegadaController.dispose();
    dataController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dataController.text =
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
        dataSelecionada =
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
      });
    }
  }

  String dataSelecionada = 'Selecione...';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false, // Evita que o teclado cause resize
      body: SingleChildScrollView(
        // Adiciona SingleChildScrollView
        child: Container(
          width: screenWidth,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                left: 25,
                top: 30,
                child: Text(
                  'Envie as despesas que teve com a sua viatura própria ',
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
                        'Kilómetros',
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
                            controller: kmController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Escreva a quantidade de kilómetro...',
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
                        'Ponto de Origem',
                        style: TextStyle(
                          color: Color.fromARGB(255, 101, 101, 101),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(153, 238, 238, 238),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextField(
                            controller: porigemController,
                            decoration: InputDecoration(
                              hintText: 'Escreva o ponto de origem...',
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
                        'Ponto de Chegada',
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
                            controller: pchegadaController,
                            decoration: InputDecoration(
                              hintText: 'Escreva o ponto de chegada...',
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
                        'Data da Deslocação',
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
                        child: InkWell(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Container(
                            width: 140,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(153, 238, 238, 238),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              child: Text(
                                dataSelecionada,
                                style: TextStyle(
                                  color: const Color(0xFFBDBDBD),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    left: 25,
                    top: 480,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (!kmController.text.isNotEmpty ||
                            !porigemController.text.isNotEmpty ||
                            !pchegadaController.text.isNotEmpty ||
                            !dataController.text.isNotEmpty) {
                          final snackBar = SnackBar(
                            content: Text(
                                'Preencha todos os campos antes de enviar.'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }

                        try {
                          await se.inserirDespesasViaturaPropria(
                            await se.obterTokenLocalmente(),
                            double.parse(kmController.text),
                            dataController.text,
                            porigemController.text,
                            pchegadaController.text,
                            false,
                          );
                        } catch (e) {
                          print('Erro ao enviar despesas: $e');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    'Erro ao enviar Despesas de Viatura Própria!'),
                                content: Text(
                                  'Dados inválidos para a submissão de despesas de viatura própria.',
                                  style: TextStyle(fontSize: 17),
                                ),
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
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Ink(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFF32D700),
                        ),
                        child: Center(
                          child: Text(
                            'Enviar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
