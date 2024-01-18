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
import 'package:olisipo_manager/noticias/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:olisipo_manager/login.dart';
import 'package:olisipo_manager/RoutePrincipal.dart';
import 'package:olisipo_manager/marcacaoReuniao/reuniao.dart';

import 'package:olisipo_manager/parcerias/metodoListarParcerias.dart';
import 'package:olisipo_manager/parcerias/parceriaIndividual.dart';

import 'package:olisipo_manager/esqueceu_pass.dart';
import 'package:olisipo_manager/redifinir_pass.dart';

class AppRoutes {
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
  static const String login = '/login';
  static const String esqueceupass = '/esqueceupass';
  static const String redifinirpass = '/redifinirpass';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePrincipal:
        return MaterialPageRoute(
            builder: (_) => Routeprincipal(
                  title: 'Route Principal',
                ));
      case login:
        return MaterialPageRoute(
            builder: (_) => LoginPage(
                  title: [],
                ));
      case esqueceupass:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      default:
        return MaterialPageRoute(
            builder: (_) => LoginPage(
                  title: [],
                ));
    }
  }
}
