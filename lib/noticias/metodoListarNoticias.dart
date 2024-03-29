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
        enlargeCenterPage: true,
      ),
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        var (tit, subt, corpo, img, tipo) = noticias[index];
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
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  img,
                  height: 250,
                  width: 350,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          'images/notFound.jpg',
                          height: 250,
                          width: 350,
                          fit: BoxFit.cover,
                        );
                      },
                ),
              ),
              Container(
                height: 250,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
