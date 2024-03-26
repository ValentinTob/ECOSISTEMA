import 'package:flutter/material.dart';


import 'package:google_generative_ai/google_generative_ai.dart';







class Vida_1_Widget extends StatefulWidget {final String titulo; // Agrega un parámetro para el título
  const Vida_1_Widget({Key? key, required this.titulo}) : super(key: key);

  @override
  State<Vida_1_Widget> createState() => _Vida_1_Widget();
}




class _Vida_1_Widget extends State<Vida_1_Widget> {

  TextEditingController _userInput = TextEditingController();

  final apiKey = "AIzaSyCSbqqPAqiP2058_w0oS5Lh-HwbEdo8WDg";

  Future <void> talkWithGemini() async {
    
    final model = GenerativeModel(model: "gemini-pro", apiKey: apiKey);                                                                  

    final msg = "Dame 5 consejos para mejorar mi salud. En tu respuesta dame unicamente los titulos de los consejos, sin añadir comentarios ni explicaciones";

    final content = Content.text(msg);

    final response = await model.generateContent([content]);

    print ("RESPUESTA: ${response.text}");
  
  }




  @override
  Widget build (BuildContext context){
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _userInput,  
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Escribe aquí...',
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      FloatingActionButton(
                        onPressed: () {
                          talkWithGemini();
                        },
                        child: Icon(Icons.arrow_right),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
}


