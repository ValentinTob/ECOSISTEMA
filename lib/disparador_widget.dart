import 'package:EcosistemaPersonal_1/Plan-Vision_widget.dart';
import 'package:EcosistemaPersonal_1/vida_1_widget.dart';
import 'package:EcosistemaPersonal_1/disparador_model.dart';


import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;




import 'disparador_model.dart' as MyModel;
import 'disparador_model.dart' hide createModel;




final scaffoldKey = GlobalKey<ScaffoldState>();




class DisparadorWidget extends StatefulWidget {
  const DisparadorWidget({Key? key}) : super(key: key);

  @override
  State<DisparadorWidget> createState() => _DisparadorWidgetState();
}





class _DisparadorWidgetState extends State<DisparadorWidget> {
  late DisparadorModel _model;
  String textoVida = '';
  String textoSalud = "";
  String textoHabito = "";
  bool isPressed = false; // Estado para controlar si se hizo clic en el ícono del micrófono
  bool textFieldVisible = false;
  // Define el controlador para el TextField
  final TextEditingController textEditingController = TextEditingController();



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





  void iniciarReconocimientoVoz(BuildContext context) async {
    stt.SpeechToText speech = stt.SpeechToText();
    bool available = await speech.initialize(
      onStatus: (status) {
        print('Status: $status'); // Maneja los eventos de estado del reconocimiento de voz
      },
      onError: (error) {
        print('Error: $error'); // Maneja los errores del reconocimiento de voz
      },
    );
    if (available) {
      speech.listen(
        onResult: (result) {
          // Maneja los resultados del reconocimiento de voz
          print('Texto reconocido: ${result.recognizedWords}');
        },
      );
    } else {
      print("El usuario ha denegado el uso del reconocimiento de voz.");
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                alignment: AlignmentDirectional(0.98, -0.60),
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
                alignment: AlignmentDirectional(0, -0.50),
                child: Text(
                  'Elegí un disparador:',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
              ),
                        




            //VIDA SOÑADA

            Align(
              alignment: AlignmentDirectional(0, -0.35), // Alineación para "Enviar"
              child: GestureDetector(
                onTap: () {
                  // Establecer el texto recibido al hacer clic en "Enviar"
                  setState(() {
                    textoVida = 'Vida soñada';
                  });


                  // Navegar a la página Vida_1_Widget con el texto adecuado
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Vida_1_Widget(titulo: 'Para construir una vida soñada...'),
                    ),
                  );


                },


                child: Text(
                  '¿Cómo construir mi vida soñada?',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            





             //SALUD

            Align(
              alignment: AlignmentDirectional(0, -0.25), // Alineación para "Enviar"
              child: GestureDetector(
                onTap: () {
                  // Establecer el texto recibido al hacer clic en "Enviar"
                  setState(() {
                    textoSalud = 'Mejorar la salud';
                  });

                  // Navegar a la página Vida_1_Widget con el texto adecuado
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Vida_1_Widget(titulo: 'Para mejorar tu salud...'),
                    ),
                  );

                },


                child: Text(
                  '¿Cómo mejorar mi salud?',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),





            //HABITO

            Align(
              alignment: AlignmentDirectional(0, -0.15), // Alineación para "Enviar"
              child: GestureDetector(
                onTap: () {
                  // Establecer el texto recibido al hacer clic en "Enviar"
                  setState(() {
                    textoHabito = 'Crear / Destruir Hábitos';
                  });

                  // Navegar a la página Vida_1_Widget con el texto adecuado
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Vida_1_Widget(titulo: 'Para trabajar en tus hábitos...'),
                    ),

                  );
                },

                child: Text(
                  '¿Cómo crear / destruir hábitos?',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),





            //BOTON

            Align(
              alignment: AlignmentDirectional(0, 0.9),
              child: ElevatedButton(
                onPressed: () async {
                  // Navegar a PlanVisionWidget con el texto recibido
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PlanVisionWidget(textoVida: textoVida, textoSalud: textoSalud, textoHabito: textoHabito),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), 
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Button',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),








            //CONSIGNA 2

          Align(
            alignment: AlignmentDirectional(0, 0.1),
            child: Text(
              'O dime un tema:',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 20,
              ),
            ),
          ),








            // Ícono del micrófono
            Align(
              alignment: AlignmentDirectional(-0.30, 0.41),
              child: IconButton(
                icon: Icon(
                  Icons.mic,
                  color: Theme.of(context).secondaryHeaderColor,
                  size: 24,
                ),
                onPressed: () {
                  // Cambia el estado para indicar que se hizo clic en el ícono
                  setState(() {
                    isPressed = !isPressed;
                  });

                  // Inicia o detiene el reconocimiento de voz
                  if (isPressed) {
                    iniciarReconocimientoVoz(context);
                  }
                },
              ),
            ),





            //ICONO DEL MENSAJE
            Align(
              alignment: AlignmentDirectional(0.40, 0.38),
              child: IconButton(
                icon: Icon(
                  Icons.message_rounded,
                  color: Theme.of(context).secondaryHeaderColor,
                  size: 24,
                ),
                onPressed: () {
                  setState(() {
                    // Cambia la visibilidad del TextField al hacer clic en el icono del mensaje
                    textFieldVisible = true;
                  });
                  // Abre el teclado cuando se hace clic en el icono del mensaje
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ),







            // Texto de entrada
            Align(
              alignment: AlignmentDirectional(0.40, 0.38),
              child: Stack(
                children: [
                  // Campo de texto
                  if (textFieldVisible)
                    Positioned(
                      left: 80, // Ajusta la posición horizontal del campo de texto
                      top: 357, // Ajusta la posición vertical del campo de texto
                      child: Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: TextField(
                          controller: textEditingController, // Asigna el controlador al TextField
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Type here...',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 55),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          onSubmitted: (text) {
                            print('Message sent: $text');
                          },
                        ),
                      ),
                    ),






                  // Botón flotante
                  if (textFieldVisible)
                    Positioned(
                      left: 290, // Ajusta la posición horizontal del botón flotante
                      top: 350, // Ajusta la posición vertical del botón flotante
                      child: FloatingActionButton(
                        onPressed: () {
                          // Imprime el texto del campo de texto en la consola
                          print('Message sent: ${textEditingController.text}');
                        },
                        child: Icon(Icons.send),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                ],
              ),
            ),

           


          
          ],
        ),
      ),
    );
  }
}