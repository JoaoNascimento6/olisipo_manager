// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:olisipo_manager/dashboard.dart';
import 'package:olisipo_manager/ajudasCusto/ajudasCusto.dart';
import 'package:olisipo_manager/ajudasCusto/viaturaPropria.dart';
import 'package:olisipo_manager/calendario/ferias.dart';
import 'package:olisipo_manager/calendario/horas.dart';
import 'package:olisipo_manager/dadosPessoais/curriculum.dart';
import 'package:olisipo_manager/dadosPessoais/dadosPessoais.dart';

import 'package:flutter/material.dart';
import 'package:olisipo_manager/login/login.dart';
import 'package:olisipo_manager/RoutePrincipal.dart';
import 'package:olisipo_manager/registo/registo.dart';

class AppRoutes {
  static const String login = '/login';
  static const String RoutePrincipal = '/RoutePrincipal';
  static const String registo = '/registo';

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
      default:
        return MaterialPageRoute(
          builder: (_) => Routeprincipal(title: 'Olisipo Manager'),
        );
    }
  }
}
