import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override

    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
        title: Text(''),
        ),

      body: Center(child: Column(children: [
        Text('hola'),
        Text('esta es una prueba'),
        Text('el contenido de arriba es abajo'),
        Row(children: [
          Expanded(child: Container(
            color: Colors.orange,
            child: Text('buenas buenas'),
          )),
          Expanded(child: Container(
            color: Color.fromARGB(255, 132, 208, 238),
            child: Text('Bienvenido'),)),
          Expanded(child: Container(
            color: Color.fromARGB(255, 228, 236, 113),
            child: Text('Hola people'),)),
          Expanded(child: Container(
            color: Color.fromARGB(255, 238, 135, 166),
            child: Text('fin'),)),
        ],)
      ],)
      ),

      );

    }

}