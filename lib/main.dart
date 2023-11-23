import 'package:flutter/material.dart';
import 'package:olisipo_manager/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(33, 150, 243, 1)),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.RoutePrincipal, // Defina a rota inicial
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
