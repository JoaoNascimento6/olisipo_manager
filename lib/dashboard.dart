// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 300,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Stack(
              children: [
                Positioned(
                  bottom: 90,
                  left: 16,
                  child: Container(
                    width: 150,
                    height: 18,
                    child: Opacity(
                      opacity: 0.90,
                      child: Text(
                        'Noticia nº1',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 228, 186,
                              186), // Set text color to contrast with the image
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 211,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('images/imagem1.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 300,
              height: 211,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('images/imagem1.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 211,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('images/imagem1.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 211,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('images/imagem1.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
