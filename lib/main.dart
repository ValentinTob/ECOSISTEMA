import 'package:EcosistemaPersonal_1/Plan-Vision_widget.dart';
import 'package:EcosistemaPersonal_1/animacion_entrada_widget.dart';
import 'package:EcosistemaPersonal_1/bienvenida_widget.dart';
import 'package:EcosistemaPersonal_1/disparador_widget.dart';
import 'package:EcosistemaPersonal_1/preg_ini_1_widget.dart';
import 'package:EcosistemaPersonal_1/preg_ini_widget.dart';
import 'package:EcosistemaPersonal_1/puerta_model.dart';
import 'package:EcosistemaPersonal_1/vida_1_widget.dart';
import 'package:EcosistemaPersonal_1/puerta_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PuertaModel(),
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
        '/': (context) => PuertaWidget(),
      
        
        
        '/preguntasIniciales1': (context) => const PreguntasIniciales1Widget(),
        '/disparador': (context) => DisparadorWidget(),
        '/plan-vision': (context) => PlanVisionWidget(textoVida: "", textoSalud: "", textoHabito: ""),
        '/vida_1': (context) => Vida_1_Widget(titulo: ""),
      },
    );
  }
}