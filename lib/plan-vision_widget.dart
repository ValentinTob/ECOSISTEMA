import 'package:flutter/material.dart';


import 'package:EcosistemaPersonal_1/Plan-Vision_model.dart';




import 'Plan-Vision_model.dart' as MyModel;
import 'Plan-Vision_model.dart' hide createModel;






class PlanVisionWidget extends StatefulWidget {
  final String textoVida;
  final String textoSalud;
  final String textoHabito;

  const PlanVisionWidget({Key? key, required this.textoVida, required this.textoSalud, required this.textoHabito}) : super(key: key);

  @override
  State<PlanVisionWidget> createState() => _PlanVisionWidgetState();
}

class _PlanVisionWidgetState extends State<PlanVisionWidget> with TickerProviderStateMixin {
  late PlanVisionModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = MyModel.createModel(context);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [



            Align(
              alignment: Alignment.topCenter,
              child: Align(
                child: Align(
                  alignment: AlignmentDirectional(0.10, -0.90), // Alineación personalizada
                  child: Text(
                    'PLAN - VISION',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: const Color(0xFFDA9D05),
                      fontSize: 43,
                    ),
                  ),
                ),
              ),
            ),


            
            Align(
              alignment: AlignmentDirectional(0, -0.50), // Ajusta los valores según sea necesario
              child: Text(
                widget.textoVida,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),


            
            Align(
              alignment: AlignmentDirectional(0, -0.50), // Ajusta los valores según sea necesario
              child: Text(
                widget.textoSalud,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),



            Align(
              alignment: AlignmentDirectional(0, -0.50), // Ajusta los valores según sea necesario
              child: Text(
                widget.textoHabito,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),



          
          ],
        ),
      ),
    );
  }
}