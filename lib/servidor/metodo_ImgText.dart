import 'package:flutter/material.dart';

class Meuwiw extends StatelessWidget {
  Meuwiw({Key? key, required this.els}) : super(key: key);

  final List<(String, String)> els;

//lsita uma imagem e o respetivo texto
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: els.length,
      itemBuilder: (BuildContext context, int index) {
        var (img, txt) = els[index];
        return Container(
          height: 50,
          child: Row(
            children: [
              Image.network(
                img,
                height: 80,
                width: 80,
              ),
              SizedBox(width: 10),
              Text('$txt'),
            ],
          ),
        );
      },
    );
  }
}
