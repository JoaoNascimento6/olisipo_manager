import 'package:flutter/material.dart';
import 'noticiaIndividual.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarrosselNoticias extends StatelessWidget {
  CarrosselNoticias({Key? key, required this.noticias}) : super(key: key);

  final List<(String, String, String, String, String)> noticias;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
      ),
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        var (img, tit, subt, corpo, tipo) = noticias[index];

        return ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalhesNoticiaPage(
                  imagem: img,
                  titulo: tit,
                  subtitulo: subt,
                  corpo: corpo,
                  tipo: tipo,
                ),
              ),
            );
            print('Botão clicado:  $tit + $tipo + $subt + $corpo');
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
                  height: 297,
                  width: 211,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 297, // Ajuste conforme necessário
                width: 211, // Ajuste conforme necessário
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
                  '$tit',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
