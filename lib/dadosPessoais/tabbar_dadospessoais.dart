import 'package:flutter/material.dart';
import 'curriculum.dart';
import 'dadosPessoais.dart';

class HeaderDadosPessoais extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Perfil Olisipo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 5,
                    color: const Color(0x33AAFFB2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x3DFFFFFF),
                      blurRadius: 3,
                      offset: const Offset(1, 1),
                      spreadRadius: 0,
                    ),
                  ],
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://via.placeholder.com/129x129',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Carlos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          top: 20,
          right: 8,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabBarDadosPessoais extends StatelessWidget {
  const TabBarDadosPessoais({Key? key, required String title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(240),
          child: AppBar(
            backgroundColor: const Color(0xFF32D700),
            flexibleSpace: HeaderDadosPessoais(),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: const <Widget>[
                Tab(
                  child: Text(
                    'Dados Pessoais',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Tab(
                  child: Text(
                    'Perfil Profissional',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: DadosPessoaisPage(title: 'Dados Pessoais'),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: CurriculumPage(title: 'Informações Profissionais'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
