import 'package:flutter/material.dart';
import 'package:repaso1/entities/student_entity.dart';

class Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SISTEMA ESCOLASTICO'),
      ),
      body: FutureBuilder<List<Student>>(
        future: Student.select(),
        builder: (context, snapshot){
          //primero validar si el estado de snapshot esta conectado
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
            } else if(snapshot.hasError){
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else{
              List<Student> data = snapshot.data as List<Student>;
              //crear un widget similar al column, permite hacer un scroll
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, element) {
                  return Card(
                    child: Text(data[element].name),
                  );
                },
              );
            }
              }),
            floatingActionButton: FloatingActionButton(
            onPressed: () { Navigator.of(context).pushNamed('/list');},
            child: Icon(Icons.add),
            ),
            );

          }
        }