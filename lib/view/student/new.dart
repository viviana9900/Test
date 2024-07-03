import 'package:flutter/material.dart';
import 'package:repaso1/entities/student_entity.dart';
import 'package:repaso1/settings/db_connection.dart';

class StudentCreate extends StatefulWidget{
const StudentCreate ({super.key});

  @override
  State<StudentCreate> createState() => _StudentCreateState();
}

class _StudentCreateState extends State<StudentCreate> {
  final studentForm = GlobalKey <FormState>();//id de formulario
  final nombreController = TextEditingController();//id de texfield de nombre
  final apellidoController = TextEditingController();//id de texfiel de apellido


  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear estudiente"),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form (//crear un witet para formulario
          key:studentForm ,
          child: Column(//añado una columna para involucrar varios elementos
            children: [
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value){//programar una funcion de validacion
                  if(value == null || value.isEmpty ){
                    return 'Este campo es requerido';
                  }
                },
              ), //caja de texto enlasada a un formulario
              SizedBox(height: 20,),
              TextFormField(
                controller: apellidoController,
                decoration: InputDecoration(labelText: 'Apellido'),
                validator: (value){//programar una funcion de validacion
                  if(value == null || value.isEmpty ){
                    return 'Este campo es requerido';
                  }
                },
              ), //c
              SizedBox(height: 20,),
               TextButton(onPressed: (){ }, child: Text("Ingresar")),
            ],
          )
        ),
      ),
    );
  }
  insert() async {
    print('Llegue a la funcion');
    if (studentForm.currentState!.validate()){
      studentForm.currentState!.save();// almacenado el estado actual de la data 
      var data = Student(
        name: nombreController.text,
        lastName: apellidoController.text
      );
      await DbConnection.insert('estudiante', data.toDictionary());
    }//validando las cajas
  }
}