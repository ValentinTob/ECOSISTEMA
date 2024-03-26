import 'package:EcosistemaPersonal_1/disparador_widget.dart';
import 'package:flutter/material.dart';



import 'package:EcosistemaPersonal_1/preg_ini_1_model.dart';
import 'preg_ini_1_model.dart' as MyModel;
import 'preg_ini_1_model.dart' hide createModel;



class PreguntasIniciales1Widget extends StatefulWidget {
  const PreguntasIniciales1Widget({Key? key}) : super(key: key);

  @override
  State<PreguntasIniciales1Widget> createState() => _PreguntasIniciales1WidgetState();
}





class _PreguntasIniciales1WidgetState extends State<PreguntasIniciales1Widget>
    with TickerProviderStateMixin {
  late PreguntasIniciales1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<bool> _checkboxValues = List.filled(5, false);

  late AnimationController _controller;
  late Animation<double> _animation;
  


  @override
  void initState() {
    super.initState();
    _model = MyModel.createModel(context);

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );


    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    Future.delayed(Duration(milliseconds: 1000), () {
      if (mounted) {
        _controller.forward();
      }
    });


  }


  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final focusNode = _model.unfocusNode;
        if (focusNode != null) {
          if (focusNode.canRequestFocus) {
            FocusScope.of(context).requestFocus(focusNode);
          } else {
            FocusScope.of(context).unfocus();
          }
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [


              //titulo
              Positioned(
                left: 43.5,
                top: 36.5,
                child: Container(
                  width: 280,
                  height: 51,
                  child: Text(
                    'ECOSISTEMA',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: Color(0xFFDA9D05),
                      fontSize: 43,
                      // Otros estilos según sea necesario
                    ),
                  ),
                ),
              ),



              //LOGO
              Align(
                alignment: AlignmentDirectional(0.98, -0.31),
                child: Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/foto (1).jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),


              Align(
                alignment: AlignmentDirectional(0, -0.10),
                            child: AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return Opacity(
                                  opacity: _animation.value,
                                  child: child,
                                );
                              },
                              child: Text(
                                '¿En qué te gustaría trabajar?',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20,
                                ),
                              ),
                            ),
              ),




              // OPCIONES
              Align(
                alignment: FractionalOffset(1, 0.80), // Alinea el widget en la esquina inferior izquierda
                child:  _buildCheckboxList(), // No se requiere la animación aquí
              ),




              //BOTON
              
              
              // Botón Siguiente
              Align(
                alignment: AlignmentDirectional(-0.03, 0.60),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DisparadorWidget()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), 
                    backgroundColor: Colors.blue, // color del botón
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 3,
                  ),
                  child: Text(
                    'Siguiente',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }



  Widget _buildCheckboxList() {
      return ListView(
        shrinkWrap: true,
        children: [
          for (int i = 0; i < 5; i++)
            CheckboxListTile(
              title: Text(
                ['HÁBITOS', 'MENTALIDAD', 'PENSAMIENTOS', 'RECURSOS', 'RESULTADOS'][i],
                style: TextStyle(fontSize: 16),
              ),
              value: _checkboxValues[i],
              onChanged: (newValue) {
                setState(() {
                  _checkboxValues[i] = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
        ],
      );
    }




}