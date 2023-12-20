import 'package:flutter/material.dart';

class DadosPessoaisPage extends StatefulWidget {
  const DadosPessoaisPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DadosPessoaisPageState createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState extends State<DadosPessoaisPage> {
  bool isEditingName = false;
  bool isEditingEmail = false;
  bool isEditingPassword = false;
  bool isEditingTaxNumber = false;

  TextEditingController nameController =
      TextEditingController(text: 'Carlos Medeiros');
  TextEditingController emailController =
      TextEditingController(text: 'carlosmed_olisipo@olisipo.pt');
  TextEditingController passwordController =
      TextEditingController(text: '12345');

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    edicaoText(
                      'Nome',
                      nameController,
                      isEditingName,
                      () => setState(() => isEditingName = !isEditingName),
                    ),
                    edicaoText(
                      'E-mail',
                      emailController,
                      isEditingEmail,
                      () => setState(() => isEditingEmail = !isEditingEmail),
                    ),
                    edicaoText(
                      'Password',
                      passwordController,
                      isEditingPassword,
                      () => setState(
                          () => isEditingPassword = !isEditingPassword),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contribuinte',
                          style: const TextStyle(
                            color: Color(0xFF727272),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '282929203',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gestão de Documentos',
                    style: const TextStyle(
                      color: Color(0xFF727272),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _showModalRecibosVencimento(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Recibos de Vencimento',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF696969),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.send,
                            color: const Color(0xFF32D700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Adicione aqui a lógica para lidar com o clique no botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Declaração para Fins Bancários',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF696969),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.download_rounded,
                            color: const Color(0xFF32D700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Adicione aqui a lógica para lidar com o clique no botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Declaração para Fins Académicos',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF696969),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.download_rounded,
                            color: const Color(0xFF32D700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget edicaoText(
    String title,
    TextEditingController controller,
    bool isEditing,
    VoidCallback onTap,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF727272),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            isEditing
                ? IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      setState(() => isEditing = false);
                      // Aqui você pode salvar as alterações no campo
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: onTap,
                  ),
          ],
        ),
        isEditing
            ? TextFormField(
                controller: controller,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              )
            : Text(
                controller.text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
        const SizedBox(height: 5),
      ],
    );
  }

  void _showModalRecibosVencimento(BuildContext context) {
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
                    'Recibos de Vencimento',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                        try {} catch (e) {
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
