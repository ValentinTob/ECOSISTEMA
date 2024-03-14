import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'one_widget.dart';
import 'two_widget.dart';
import 'three_widget.dart';
import 'four_widget.dart';
import 'perfil_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Aquí creamos una instancia del GoRouter y la proporcionamos a través de Provider
        Provider<GoRouter>(
          create: (_) => GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => OneWidget(),
              ),
              GoRoute(
                path: '/TWO',
                builder: (context, state) => TwoWidget(),
              ),
              GoRoute(
                path: '/THREE',
                builder: (context, state) => ThreeWidget(),
              ),
              GoRoute(
                path: '/FOUR',
                builder: (context, state) => FourWidget(),
              ),
              GoRoute(
                path: '/PERFIL',
                builder: (context, state) => PerfilWidget(),
              ),
            ],
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ecosistema Personal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerDelegate: Provider.of<GoRouter>(context).routerDelegate,
      routeInformationParser: Provider.of<GoRouter>(context).routeInformationParser,
    );
  }
}
