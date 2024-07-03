import 'package:flutter/material.dart';
import 'package:repaso1/entities/career_entity.dart';
import 'package:repaso1/settings/db_connection.dart';

class CareerCreate extends StatefulWidget {
  const CareerCreate({super.key});

  @override
  State<CareerCreate> createState() => _CareerCreateState();
}

class _CareerCreateState extends State<CareerCreate> {
  final careerForm = GlobalKey<FormState>();//id de formulario
  final nameController = TextEditingController();//id de texfield de nombre
  final facultyController = TextEditingController();//id de texfield de facultad
  final modalityController = TextEditingController();//id de texfield de modalidad
  final descriptionController = TextEditingController();//id de texfield de descripción

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Carrera"),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form (
          key:careerForm ,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value){
                  if(value == null || value.isEmpty ){
                    return 'Este campo es requerido';
                  }
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: facultyController,
                decoration: InputDecoration(labelText: 'Facultad'),
                validator: (value){
                  if(value == null || value.isEmpty ){
                    return 'Este campo es requerido';
                  }
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: modalityController,
                decoration: InputDecoration(labelText: 'Modalidad'),
                validator: (value){
                  if(value == null || value.isEmpty ){
                    return 'Este campo es requerido';
                  }
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value){
                  if(value == null || value.isEmpty ){
                    return 'Este campo es requerido';
                  }
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton (
                onPressed: (){
                  insert();
                },
                child: Text ('Insertar Carrera')
              )
            ],
          )
        ),
      ),
    );
  }

  insert() async {
    print('Llegue a la funcion');
    if (careerForm.currentState!.validate()){
      careerForm.currentState!.save();
      var data = Career(
        name: nameController.text,
        faculty: facultyController.text,
        modality: modalityController.text,
        description: descriptionController.text
      );
      await DbConnection.insert('carrera', data.toDictionary());
    }
  }
}
