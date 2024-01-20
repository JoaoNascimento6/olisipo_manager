import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/basededados.dart';
import '../servidor/servidor.dart';
import 'package:flutter/services.dart';
import 'pdf_banco.dart';
import 'pdf_academico.dart';
import 'recibos.dart';

class DadosPessoaisPage extends StatefulWidget {
  const DadosPessoaisPage({Key? key, required this.title, required this.dados})
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
  _DadosPessoaisPageState createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState extends State<DadosPessoaisPage> {
  var bd = Basededados();
  var se = Servidor();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.dados.$1;
    emailController.text = widget.dados.$2;
    contrController.text = widget.dados.$3;
  }

  bool isEditingName = false;
  bool isEditingEmail = false;
  bool isEditingPassword = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contrController = TextEditingController();
  TextEditingController passwordController =
      TextEditingController(text: '**********');

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();

    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bd.MostrarPessoas();

    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    edicaoDados(
                      'Nome',
                      nameController,
                      isEditingName,
                      () => setState(() => isEditingName = !isEditingName),
                    ),
                    edicaoDados(
                      'E-mail',
                      emailController,
                      isEditingEmail,
                      () => setState(() => isEditingEmail = !isEditingEmail),
                    ),
                    updatePassword(
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
                          contrController.text,
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
                        ReciboPage().showModalRecibosVencimento(context);
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
                        createPDF(nameController.text, contrController.text);
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
                        createPDFA(nameController.text, contrController.text);
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

  Widget edicaoDados(
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
            Row(
              children: [
                if (!isEditing)
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        isEditingName = true;
                        isEditingEmail = true;
                      });
                    },
                  ),
                if (isEditing)
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () async {
                      bool confirm = await showConfirmationDialog(context);
                      if (confirm) {
                        await se.inserirDadosAuxiliares(
                          await se.obterTokenLocalmente(),
                          nameController.text,
                          emailController.text,
                        );

                        setState(() {
                          nameController.text = widget.dados.$1;
                          emailController.text = widget.dados.$2;
                          isEditingName = false;
                          isEditingEmail = false;
                        });
                      }
                    },
                  ),
              ],
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

  Widget updatePassword(
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
            Row(
              children: [
                if (!isEditing)
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        isEditingPassword = true;
                        passwordController.text = '';
                      });
                    },
                  ),
                if (isEditing)
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () async {
                      bool confirm = await showConfirmationDialogPass(context);
                      if (confirm) {
                        await se.updatePassword(await se.obterTokenLocalmente(),
                            passwordController.text);
                        setState(() {
                          passwordController.text = '**********';
                          isEditingPassword = false;
                        });
                      }
                    },
                  ),
              ],
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

  Future<bool> showConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirmar Alterações'),
              content: Text(
                'Deseja confirmar as alterações nos dados pessoais? Terá de aguardar por confirmação pelo administrador para ver as suas novas alterações.',
                style: TextStyle(fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    setState(() => isEditingEmail = false);
                    setState(() => isEditingName = false);
                    nameController.text = widget.dados.$1;
                    emailController.text = widget.dados.$2;
                    Navigator.of(context).pop(false);
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop(true);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Nome e E-mail atualizado com sucesso! Aguarde aprovação.'),
                      ),
                    );
                  },
                  child: Text('Confirmar'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Future<bool> showConfirmationDialogPass(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirmar Alteração'),
              content: Text(
                'Deseja confirmar a alteração da password?',
                style: TextStyle(fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    setState(() => isEditingPassword = false);
                    passwordController.text = '**********';
                    Navigator.of(context).pop(false);
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop(true);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password atualizada com sucesso!'),
                      ),
                    );
                  },
                  child: Text('Confirmar'),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
