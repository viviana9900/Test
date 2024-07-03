import 'package:flutter/material.dart';
import 'package:repaso1/entities/faculty_entity.dart';
import 'package:repaso1/settings/db_connection.dart';



class FacultyCreate extends StatefulWidget {
  const FacultyCreate({super.key});

  @override
  State<FacultyCreate> createState() => _FacultyCreateState();
}

class _FacultyCreateState extends State<FacultyCreate> {
  final facultyForm = GlobalKey<FormState>();//id de formulario
  final nameController = TextEditingController();//id de texfield de nombre
  final descriptionController = TextEditingController();//id de texfield de descripción
  final emailController = TextEditingController();//id de texfield de email
  final phoneController = TextEditingController();//id de texfield de teléfono

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Facultad"),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form (
          key:facultyForm ,
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
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value){
                  if(value == null || value.isEmpty ){
                    return 'Este campo es requerido';
                  }
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value){
                  if(value == null || value.isEmpty ){
                    return 'Este campo es requerido';
                  }
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Teléfono'),
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
                child: Text ('Insertar Facultad')
              )
            ],
          )
        ),
      ),
    );
  }

  insert() async {
    print('Llegue a la funcion');
    if (facultyForm.currentState!.validate()){
      facultyForm.currentState!.save();
      var data = Faculty(
        name: nameController.text,
        description: descriptionController.text,
        email: emailController.text,
        phone: phoneController.text
      );
      await DbConnection.insert('facultad', data.toDictionary());
    }
  }
}
