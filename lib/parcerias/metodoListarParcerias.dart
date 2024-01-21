import 'package:flutter/material.dart';
import 'parceriaIndividual.dart';
import 'package:olisipo_manager/servidor/servidor.dart';

class ListarParcerias extends StatelessWidget {
  ListarParcerias({Key? key, required this.els}) : super(key: key);

  final List<(String, String, String, String, String)> els;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: (els.length / 3).ceil(),
            itemBuilder: (BuildContext context, int index) {
              int startIndex = index * 3;
              int endIndex = (index + 1) * 3;
              endIndex = endIndex > els.length ? els.length : endIndex;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(endIndex - startIndex, (i) {
                  var (img, nome, desc, benef, tipo) = els[startIndex + i];

                  return ElevatedButton(
                    onPressed: () {
                      // Adicione aqui a lógica que deseja executar ao clicar no botão
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalhesParceriaPage(
                              imagem: img,
                              nome: nome,
                              descricao: desc,
                              beneficios: benef,
                              tipo: tipo),
                        ),
                      );
                      print('Botão clicado:  $nome + $tipo + $desc + $benef');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            img,
                            height: 110,
                            width: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 110, // Ajuste conforme necessário
                          width: 110, // Ajuste conforme necessário
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            '$nome',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
            },
          ),
        ),
        SizedBox(height: 10), // Adicione espaçamento na parte inferior
      ],
    );
  }
}
