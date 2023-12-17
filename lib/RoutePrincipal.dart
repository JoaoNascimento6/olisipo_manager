// ignore_for_file: unused_import, prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:olisipo_manager/routes/routes.dart';
import 'login/login.dart';

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
  Widget _currentPage = Center(child: Text('Placeholder'));
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          _currentPage = LoginPage(title: 'Login');
          break;
        case 1:
          _currentPage = LoginPage(title: 'Login');
          break;
        case 2:
          _currentPage = LoginPage(title: 'Login');
          break;
        case 3:
          _currentPage = LoginPage(title: 'Login');
          break;
        case 4:
          _currentPage = LoginPage(title: 'Login');
          break;
        default:
          _currentPage = LoginPage(title: 'Login');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
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
                label: 'Horas/Férias',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money), // Ícone para a opção de Custos
                label: 'Custos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people), // Ícone para a opção de Parcerias
                label: 'Parcerias',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person), // Ícone para a opção de Perfil
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
      body: <Widget>[
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child:
                  _currentPage, // Substitua esta linha pelo conteúdo da variável _currentPage
            ),
          ),
        ),
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Tab 2',
              ),
            ),
          ),
        ),
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Tab 3',
              ),
            ),
          ),
        ),
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Tab 3',
              ),
            ),
          ),
        ),
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Tab 3',
              ),
            ),
          ),
        ),
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Tab 3',
              ),
            ),
          ),
        ),
      ][_selectedIndex],
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
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
            ListTile(
              title: const Text('Registo'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.registo);
              },
            ),
            ListTile(
              title: const Text('dashboard'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.dashboard);
              },
            ),
            ListTile(
              title: const Text('parcerias'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.parcerias);
              },
            ),
            ListTile(
              title: const Text('parceria individual'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.parceriaIndividual);
              },
            ),
            ListTile(
              title: const Text('reuniao'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.reuniao);
              },
            ),
            ListTile(
              title: const Text('Tabbar Despesas e Custos'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.tabbar_custos);
              },
            ),
            ListTile(
              title: const Text('Tabbar Horas e Férias'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.tabbar_calendario);
              },
            ),
            ListTile(
              title: const Text('Tabbar Dados Pessoais'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.tabbar_dadospessoais);
              },
            ),

            /*ListTile(
                title: const Text('Apagar'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Papagar(title: 'Apagar')),
                  );
                },
              ),
              ListTile(
                title: const Text('Listar Users'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ListarUsers()),
                  );
                },
              ),*/
          ],
        ),
      ),
    );
  }
}
