// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:olisipo_manager/ajudasCusto/ajudasCusto.dart';
import 'package:olisipo_manager/ajudasCusto/viaturaPropria.dart';
import 'package:olisipo_manager/calendario/ferias.dart';
import 'package:olisipo_manager/calendario/horas.dart';
import 'package:olisipo_manager/dadosPessoais/curriculum.dart';
import 'package:olisipo_manager/dadosPessoais/dadosPessoais.dart';
import 'package:olisipo_manager/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:olisipo_manager/login/login.dart';
import 'package:olisipo_manager/RoutePrincipal.dart';
import 'package:olisipo_manager/marcacaoReuniao/reuniao.dart';
import 'package:olisipo_manager/parcerias/parcerias.dart';
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

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => LoginPage(title: 'Olisipo Manager'),
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
      case ferias:
        return MaterialPageRoute(
          builder: (_) => FeriasPage(title: 'Marcação de Ferias'),
        );
      case horas:
        return MaterialPageRoute(
          builder: (_) => HorasPage(title: 'Marcação de Horas'),
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
          builder: (_) => ParceriasPage(title: 'Olisipo Manager'),
        );
      case parceriaIndividual:
        return MaterialPageRoute(
          builder: (_) => ParceriaIndividualPage(title: 'Olisipo Manager'),
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
