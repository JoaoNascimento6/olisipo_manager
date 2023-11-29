import 'package:flutter/material.dart';

class Meuwiw extends StatelessWidget {
  Meuwiw({Key? key, required this.els}) : super(key: key);

  final List<(String, String)> els;

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: els.length,
      itemBuilder: (BuildContext context, int index) {
        var (fn,ln)=els[index];
        return Container(
          height: 50,
          child: Row(
            children: [
              Text('$fn'),
              SizedBox(width: 10),
              Text('$ln'),
            ],
          ),
        );
      },
    );
  }
}
