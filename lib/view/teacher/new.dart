import 'package:flutter/material.dart';
import 'package:repaso1/entities/teacher_entity.dart';
import 'package:repaso1/settings/db_connection.dart';

class TeacherCreate extends StatefulWidget {
  const TeacherCreate({super.key});

  @override
  State<TeacherCreate> createState() => _TeacherCreateState();
}

class _TeacherCreateState extends State<TeacherCreate> {
  final teacherForm = GlobalKey<FormState>();//id de formulario
  final nameController = TextEditingController();//id de texfield de nombre
  final lastNameController = TextEditingController();//id de texfield de apellido
  final subjectController = TextEditingController();//id de texfield de asignatura
  final emailController = TextEditingController();//id de texfield de email

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Docente"),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form (
          key:teacherForm ,
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
                controller: lastNameController,
                decoration: InputDecoration(labelText: 'Apellido'),
                validator: (value){
                  if(value == null || value.isEmpty ){
                    return 'Este campo es requerido';
                  }
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: subjectController,
                decoration: InputDecoration(labelText: 'Asignatura'),
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
              ElevatedButton (
                onPressed: (){
                  insert();
                },
                child: Text ('Insertar Docente')
              )
            ],
          )
        ),
      ),
    );
  }

  insert() async {
    print('Llegue a la funcion');
    if (teacherForm.currentState!.validate()){
      teacherForm.currentState!.save();
      var data = Teacher(
        name: nameController.text,
        lastName: lastNameController.text,
        subject: subjectController.text,
        email: emailController.text
      );
      await DbConnection.insert('docente', data.toDictionary());
    }
  }
}
