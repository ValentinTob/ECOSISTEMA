import 'package:EcosistemaPersonal_1/bienvenida_model.dart';
import 'package:EcosistemaPersonal_1/puerta_widget.dart';
import 'package:EcosistemaPersonal_1/preg_ini_widget.dart';
import 'package:flutter/material.dart';






class BienvenidaWidget extends StatefulWidget {
  const BienvenidaWidget({super.key});

  @override
  State<BienvenidaWidget> createState() => _BienvenidaWidgetState();
}



class _BienvenidaWidgetState extends State<BienvenidaWidget>
    with TickerProviderStateMixin {
  late BienvenidaModel _model;


  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  bool _startAnimation = false;
  bool _startAnimationButton = false;

  late AnimationController _buttonController;
  late Animation<double> _buttonAnimation;    

  



  final scaffoldKey = GlobalKey<ScaffoldState>();


  


  @override
  void initState() {
    super.initState();

    // Inicializa _model aquí sin usar createModel
    _model = BienvenidaModel();

    // Iniciar la animación después de un retraso
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _startAnimationButton = true;
      });
    });



    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );


    _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(seconds: 20), () {
            _controller.forward();
          });
        }
      });


    // Iniciar la animación después de un retraso
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _startAnimation = true;
      });
    });



    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );


    _controller.forward();


    _buttonController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
      );


    // Iniciar la animación del botón cuando el widget se cargue
    _buttonController.forward();

      
      _buttonAnimation = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: _buttonController,
          curve: Curves.easeInOut,
        ),
      );

    // Inicia la animación del botón cuando el widget se cargue
    _buttonController.forward();     
  
  }


void _startButtonAnimationAfterDelay() async {
  // Retraso adicional de 20 segundos antes de iniciar la animación del botón
  await Future.delayed(Duration(seconds: 20));

  setState(() {
    _startAnimation = true;
  });
}





  @override
  void dispose() {
    _model.dispose();
    _controller.dispose();
    _buttonController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PuertaWidget()),
        );
        return true;
      },
      child: GestureDetector(
        onTap: () {
          if (_model != null && _model.unfocusNode != null) {
            final focusNode = _model.unfocusNode!;
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



                //TITULO
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
              FadeTransition(
                opacity: _controller.drive(
                  Tween<double>(begin: 0, end: 1).chain(
                    CurveTween(curve: Curves.easeInOut),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.98, -0.31),
                  child: Container(
                    width: 60,
                    height: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/foto (1).jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),



              //BIENVENIDO
 
            AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _opacityAnimation,
                      child: Align(
                        alignment: AlignmentDirectional(0, -0.13),
                        child: Text(
                          '¡Bienvenido a tu nueva mejor versión!',
                          style: TextStyle(
                            // Define el estilo de texto aquí
                            color: Colors.white,
                            fontSize: 20, // Modifica el tamaño de fuente según sea necesario
                          ),
                        ),
                      ),
                    );
                  },
                ),



                // me llamo...

                Align(
                  alignment: AlignmentDirectional(0, -0.15),
                  child: FadeTransition(
                    opacity: _controller.drive(
                      Tween<double>(begin: 0, end: 1).chain(
                        CurveTween(curve: Curves.easeInOut),
                      ),
                    ),
                    child: Text(
                      'Me llamo ECOSISTEMA,\ny seré tu asistente en este proceso.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),





                // fui creada con
                AnimatedOpacity(
                  opacity: _startAnimation ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 1000),
                  child: Align(
                    alignment: AlignmentDirectional(10, -0.08),
                    child: Text(
                      'Fuí creada con Inteligencia Artificial,\ny vas a poder contar conmigo para lo que necesites.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),


                //boton comenzemos

                Align(
                  alignment: AlignmentDirectional(0.03, 0.13),
                  child: AnimatedOpacity(
                    opacity: _startAnimationButton ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500), // Duración de la animación
                    curve: Curves.easeInOut, // Curva de animación
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PreguntasInicialesWidget()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Cambia el color del botón según sea necesario
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Comencemos!',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 16, // Modifica el tamaño de fuente según sea necesario
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}