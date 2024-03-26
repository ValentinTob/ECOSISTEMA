import 'package:EcosistemaPersonal_1/preg_ini_1_widget.dart';
import 'package:EcosistemaPersonal_1/preg_ini_model.dart';
import 'package:flutter/material.dart';



class PreguntasInicialesWidget extends StatefulWidget {
  const PreguntasInicialesWidget({Key? key}) : super(key: key);

  @override
  State<PreguntasInicialesWidget> createState() => _PreguntasInicialesWidgetState();
}





class _PreguntasInicialesWidgetState extends State<PreguntasInicialesWidget>
    with TickerProviderStateMixin {

  late PreguntasInicialesModel _model;
  late AnimationController _controller;
  bool _mounted = false;
  

  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();
  bool _isMounted = false;





  final scaffoldKey = GlobalKey<ScaffoldState>();




  @override
  void initState() {
    super.initState();
    _model = PreguntasInicialesModel(); // Crear manualmente el modelo


    _mounted = true;

    _isMounted = true;


    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );


    // Agregar un retraso antes de iniciar la animación
    Future.delayed(Duration(seconds: 3), () {
      if (_mounted) { // Verificar si el widget sigue montado antes de iniciar la animación
        _controller.forward(); // Iniciar la animación
      }
    });



    Future.delayed(Duration(milliseconds: 2000), () {
      if (_isMounted) {
        setState(() {}); // Actualizar el estado para aplicar la animación
      }
    });

  
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();

    _controller.dispose();
    _mounted = false; // Establecer la bandera en false al desmontar el widget

    _isMounted = false;
    _textController.dispose();
    _textFieldFocusNode.dispose();
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





              //logo
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




              //pregunta 1
               FadeTransition(
                opacity: _controller.drive(Tween(begin: 0.0, end: 1.0)),
                child: Text(
                  'Dime ¿Cúal es tu nombre y edad?', // Reemplaza con tu texto
                  style: TextStyle(
                    fontSize: 30, // Ajusta el tamaño de fuente según sea necesario
                    color: Color.fromARGB(255, 255, 255, 255), // Ajusta el color según sea necesario
                    decoration: TextDecoration.none, // R
                  ),
                ),
              ),




              //ingreso nombre 
              Align(
                alignment: AlignmentDirectional(0, 0.10),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'NOMBRE',
                      labelStyle: TextStyle(fontSize: 16),
                      hintStyle: TextStyle(fontSize: 16),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese un nombre válido';
                      }
                      return null; // Devuelve null si la validación es exitosa
                    },
                  ),
                ),
              ),







              
              // Ingreso de edad
              Align(
                alignment: AlignmentDirectional(0, 0.35),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'EDAD',
                      labelStyle: TextStyle(fontSize: 16),
                      hintStyle: TextStyle(fontSize: 16),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese una edad válida';
                      }
                      return null; // Devuelve null si la validación es exitosa
                    },
                  ),
                ),
              ),





              
              // Botón Siguiente
              Align(
                alignment: AlignmentDirectional(-0.03, 0.60),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PreguntasIniciales1Widget()));
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
}


