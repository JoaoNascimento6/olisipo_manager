// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:olisipo_manager/ajudasCusto/ajudasCusto.dart';
import 'package:olisipo_manager/ajudasCusto/viaturaPropria.dart';
import 'package:olisipo_manager/ajudasCusto/tabbar_custos.dart';
import 'package:olisipo_manager/calendario/tabbar_calendario.dart';
import 'package:olisipo_manager/calendario/ferias.dart';
import 'package:olisipo_manager/calendario/horas.dart';
import 'package:olisipo_manager/dadosPessoais/tabbar_dadospessoais.dart';
import 'package:olisipo_manager/dadosPessoais/curriculum.dart';
import 'package:olisipo_manager/dadosPessoais/dadosPessoais.dart';
import 'package:olisipo_manager/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:olisipo_manager/login/login.dart';
import 'package:olisipo_manager/RoutePrincipal.dart';
import 'package:olisipo_manager/registo/registo.dart';
import 'package:olisipo_manager/marcacaoReuniao/reuniao.dart';

import 'package:olisipo_manager/parcerias/metodoListarParcerias.dart';
import 'package:olisipo_manager/parcerias/parceriaIndividual.dart';

class AppRoutes {
  static const String login = '/login';
  static const String RoutePrincipal = '/RoutePrincipal';
  static const String registo = '/registo';
  static const String dashboard = '/dashboard';
  static const String reuniao = '/reuniao';
  static const String parcerias = '/parcerias';
  static const String parceriaIndividual = '/parceriaindividual';
  static const String ajudasCusto = '/ajudasCusto';
  static const String viaturaPropria = '/viaturaPropria';
  static const String ferias = '/ferias';
  static const String horas = '/horas';
  static const String curriculum = '/curriculum';
  static const String dadosPessoais = '/dadosPessoais';
  static const String tabbar_custos = '/tabbarcustos';
  static const String tabbar_calendario = '/tabbarcalendario';
  static const String tabbar_dadospessoais = '/tabbardadospessoais';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => LoginPage(title: 'Olisipo Manager'),
        );
      case registo:
        return MaterialPageRoute(
          builder: (_) => RegistoPage(title: 'Olisipo Manager'),
        );
      case dashboard:
        return MaterialPageRoute(
          builder: (_) => DashboardPage(title: 'Olisipo Manager'),
        );

      case ajudasCusto:
        return MaterialPageRoute(
          builder: (_) => AjudasCustoPage(title: 'Ajudas de Custo'),
        );
      case viaturaPropria:
        return MaterialPageRoute(
          builder: (_) => ViaturaPropriaPage(title: 'Ajudas Viatura Propria'),
        );
      case tabbar_custos:
        return MaterialPageRoute(
          builder: (_) => TabBarGestaoCustos(title: 'Tabbar Custos'),
        );
      case tabbar_calendario:
        return MaterialPageRoute(
          builder: (_) => TabBarHorasFerias(title: 'Tabbar Calendario'),
        );
      case ferias:
        return MaterialPageRoute(
          builder: (_) => FeriasPage(title: 'Marcação de Ferias'),
        );
      case horas:
        return MaterialPageRoute(
          builder: (_) => HorasPage(title: 'Marcação de Horas'),
        );
      case tabbar_dadospessoais:
        return MaterialPageRoute(
          builder: (_) => TabBarDadosPessoais(title: 'TabBar DadosPessoais'),
        );
      case curriculum:
        return MaterialPageRoute(
          builder: (_) => CurriculumPage(title: 'Curriculum'),
        );
      case dadosPessoais:
        return MaterialPageRoute(
          builder: (_) => DadosPessoaisPage(title: 'Dados Pessoais'),
        );
      case parcerias:
        return MaterialPageRoute(
          builder: (_) => ListarParcerias(),
        );

      
      case reuniao:
        return MaterialPageRoute(
          builder: (_) => ReuniaoPage(title: 'Olisipo Manager'),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Routeprincipal(title: 'Olisipo Manager'),
        );
    }
  }
}
