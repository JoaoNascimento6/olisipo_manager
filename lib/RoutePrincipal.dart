// ignore_for_file: unused_import, prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:olisipo_manager/routes/routes.dart';
//import 'login/login.dart';
import 'calendario/tabbar_calendario.dart';
import 'ajudasCusto/tabbar_custos.dart';
import 'dadosPessoais/tabbar_dadospessoais.dart';
import 'parcerias/metodoListarParcerias.dart';
import 'dashboard.dart';
import './servidor/servidor.dart';
import 'marcacaoReuniao/reuniao.dart';

class Routeprincipal extends StatefulWidget {
  const Routeprincipal({super.key, required this.title});

  final String title;

  @override
  State<Routeprincipal> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Routeprincipal> {
  /*var bd = Basededados();

    void consulta_registo() {
      bd.consulta();
    }
  */
  var se = Servidor();

  @override
  void initState() {
    super.initState();
    se.listarParceriasServer();


    _selectedIndex = 0;
    _currentPage = DashboardPage(title: 'Home');

  }

  Widget _currentPage = Center(child: Text('Placeholder'));
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          _currentPage = DashboardPage(title: 'Home');
          break;
        case 1:
          _currentPage = TabBarHorasFerias(title: 'Tabbar Horas/Férias');
          break;
        case 2:
          _currentPage =
              TabBarGestaoCustos(title: 'Tabbar Viatura/AjudasCusto');
          break;
        case 3:
          _currentPage = ListarParcerias();
          break;
        case 4:
          _currentPage = ReuniaoPage(title: 'Reunião');
          break;
        case 5:
          _currentPage = TabBarDadosPessoais(title: 'Tabbar Dados/Pessoais');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),*/
      extendBody: true,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(0, 255, 0, 0),
            selectedItemColor: Color(0xff32d700),
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                label: 'Calendário',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                label: 'Custos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.handshake_outlined),
                label: 'Parcerias',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Reunião',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: screenWidth,
        child: <Widget>[
          Card(
            margin: EdgeInsets.all(0),
            shadowColor: Colors.transparent,
            child: SizedBox.expand(
              child: Center(
                child: _currentPage,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(0),
            shadowColor: Colors.transparent,
            child: SizedBox.expand(
              child: Center(
                child: _currentPage,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(0),
            shadowColor: Colors.transparent,
            child: SizedBox.expand(
              child: Center(
                child: _currentPage,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(0),
            shadowColor: Colors.transparent,
            child: SizedBox.expand(
              child: Center(
                child: _currentPage,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(0),
            shadowColor: Colors.transparent,
            child: SizedBox.expand(
              child: Center(
                child: _currentPage,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(0),
            shadowColor: Colors.transparent,
            child: SizedBox.expand(
              child: Center(
                child: _currentPage,
              ),
            ),
          ),
        ][_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(33, 150, 243, 1),
              ),
              child: Text('Olisipo'),
            ),
            /*ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),*/
            ListTile(
              title: const Text('Registo'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.registo);
              },
            ),
          ],
        ),
      ),
    );
  }
}
