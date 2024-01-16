/* import 'package:flutter/material.dart';
import 'noticiaIndividual.dart';
import 'package:olisipo_manager/servidor/servidor.dart';

class ListarNoticias extends StatelessWidget {
  ListarNoticias({Key? key, required this.els}) : super(key: key);

  final List<(int, String, String, String, String, String, String, bool)> els;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: (els.length / 3).ceil(),
            itemBuilder: (BuildContext context, int index) {
              int startIndex = index * 3;
              int endIndex = (index + 1) * 3;
              endIndex = endIndex > els.length ? els.length : endIndex;

              List<Widget> items = List.generate(endIndex - startIndex, (i) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalhesNoticiaPage(
                            id: id,
                            imagem: img,
                            titulo: titulo,
                            subtitulo: subtitulo,
                            corpo: corpo,
                            tipo: tipo,
                            publicada: publicada,
                          ),
                        ),
                      );
                      print(
                          'Botão clicado:  $titulo + $tipo + $id + $subtitulo + $corpo');
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
                            '$titulo',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });

              return Column(
                children: items,
              );
            },
          ),
        ),
        SizedBox(height: 10), // Adicione espaçamento na parte inferior
      ],
    );
  }
}
 */