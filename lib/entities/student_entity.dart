import 'package:repaso1/settings/db_connection.dart';

class Student{
  int? id;
  String name;
  String lastName;

  Student({ //creacion del constructor
    this.id, //parametro opcional
    required this.name, //parametro requerido 
    required this.lastName //parametro requerido
    });

    //crear la clase el diccionario a la clase de diccionario
    //esto se utiliza al momento de seleccionar los datos
    //acpta como paametro el tipo de diccionarios (Map)
    factory Student.fromDictionary(Map<String, dynamic> data) => Student(
      id: data['id'], //extraer id de la data 
      name: data['name'], //extraer name de la data
      lastName: data ['lastName'] //extraer lastname de la data
    );

    //se crea la fincion para parse de clase a diccionario
    //esto se utiliza al moemento de registrar datos (insert, update)
    //no acepta nada como argumento
    Map<String, dynamic> toDictionary() => {
      'id': id, //asignar el valor de id en el diccionario
      'name': name, //asignar el valor de name del diccionario
      'lastName':lastName, // asignar el valor de lastname en el diccionario
      
    };

  //se transforma un listado de estudiantes con List.generate
    static Future<List<Student>> select() async {
      var data = await DbConnection.list("estudiante");
      if(data.isEmpty){
        return List.empty();
      } else {
        return List.generate(
          data.length,
          (index) => Student.fromDictionary(data[index])
        );
      }

    }

}