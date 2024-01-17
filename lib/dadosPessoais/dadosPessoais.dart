import 'package:flutter/material.dart';
import 'package:olisipo_manager/servidor/basededados.dart';
import '../servidor/basededados.dart';

class DadosPessoaisPage extends StatefulWidget {
  const DadosPessoaisPage({Key? key, required this.title,required this.dados} ) : super(key: key);

  final String title;
  final (String,String,String,String, List<(String, String, String, String)>) dados;
  

  @override
  _DadosPessoaisPageState createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState extends State<DadosPessoaisPage> {
  var bd = Basededados();


   @override
  void initState() {
    super.initState();

    // Atribuir valores iniciais aos controladores
    nameController.text = widget.dados.$1;
    emailController.text = widget.dados.$2;
    contrController.text = widget.dados.$3;
  }
  bool isEditingName = false;
  bool isEditingEmail = false;
  bool isEditingPassword = false;
  bool isEditingTaxNumber = false;

  TextEditingController nameController =
      TextEditingController();
  TextEditingController emailController =
      TextEditingController();
       TextEditingController contrController =
      TextEditingController();
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
    int selectedMonth = DateTime.now().month;
    int selectedYear = DateTime.now().year;

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 400,
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
                SizedBox(height: 16),
                Text(
                  'Escolha o mês:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<int>(
                        value: selectedMonth,
                        onChanged: (newValue) {
                          // Atualiza o mês selecionado
                          if (newValue != null) {
                            selectedMonth = newValue;
                          }
                        },
                        items: List.generate(12, (index) {
                          return DropdownMenuItem<int>(
                            value: index + 1,
                            child: Text('${index + 1}'),
                          );
                        }),
                        hint: Text('Selecione o mês'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Escolha o ano:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<int>(
                        value: selectedYear,
                        onChanged: (newValue) {
                          // Atualiza o ano selecionado
                          if (newValue != null) {
                            selectedYear = newValue;
                          }
                        },
                        items: List.generate(10, (index) {
                          return DropdownMenuItem<int>(
                            value: DateTime.now().year + index,
                            child: Text('${DateTime.now().year + index}'),
                          );
                        }),
                        hint: Text('Selecione o ano'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para o botão de documento comprovativo
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    alignment: Alignment.centerLeft,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(Icons.upload, color: Colors.green),
                        SizedBox(width: 8),
                        Text(
                          'Download do Comprovativo',
                          style: TextStyle(
                            color: Colors.green,
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
      },
    );
  }
}
