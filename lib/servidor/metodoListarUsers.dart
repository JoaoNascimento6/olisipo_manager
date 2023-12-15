import 'package:flutter/material.dart';

class ListUser extends StatelessWidget {
  ListUser({super.key, required this.els});
  final List<String> els;
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: els.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.blue[200],
            child:
                Center(child: Text(els[index], style: TextStyle(fontSize: 22))),
          );
        });
  }
}
