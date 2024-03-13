import 'package:EcosistemaPersonal/menu_perfil_widget.dart';
import 'package:EcosistemaPersonal/perfil_widget.dart';
import 'package:flutter/material.dart';
import 'one_widget.dart';
import 'perfil_model.dart';
import 'two_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PerfilModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecosistema Personal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OneWidget(),
        '/two': (context) => const TwoWidget(),
        '/perfil': (context) => PerfilWidget(
            model: Provider.of<PerfilModel>(
                context)), // Pasar la instancia de PerfilModel
        '/perfil_menu': (context) => const MenuPerfilWidget(),
      },
    );
  }
}
