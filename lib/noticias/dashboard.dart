import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Olisipo"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1ª secção
              Text(
                "Olá Carlos!",
                style: TextStyle(fontSize: 18.0),
              ),
              Center(
                child: Text(
                  "Olisipo",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),

              // 2ª secção
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Notícias",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton("Botão 1"),
                  _buildButton("Botão 2"),
                  _buildButton("Botão 3"),
                  _buildButton("Botão 4"),
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                ),
                items: [
                  _buildCarouselItem("Imagem 1", "Título 1", "Subtítulo 1"),
                  _buildCarouselItem("Imagem 2", "Título 2", "Subtítulo 2"),
                  _buildCarouselItem("Imagem 3", "Título 3", "Subtítulo 3"),
                ],
              ),

              // 3ª secção
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Estado das Submissões",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              _buildRow("Texto 1", "Direita 1"),
              _buildRow("Texto 2", "Direita 2"),
              _buildRow("Texto 3", "Direita 3"),
              _buildRow("Texto 4", "Direita 4"),
              _buildRow("Texto 5", "Direita 5"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Container(
      width: 80.0,
      height: 40.0,
      color: Colors.grey,
      child: Center(
        child: Text(text),
      ),
    );
  }

  Widget _buildCarouselItem(String imageUrl, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl,
              height: 120.0, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              subtitle,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leftText),
        Text(rightText),
      ],
    );
  }
}
