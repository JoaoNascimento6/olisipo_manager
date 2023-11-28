import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Olisipo Manager'),
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
                  Positioned(
                    bottom: 0,
                    left: 16,
                    child: SizedBox(
                      width: 148.93,
                      height: 16.45,
                      child: Opacity(
                        opacity: 0.90,
                        child: Text(
                          'Noticia nº1',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
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
        ));
  }
}
