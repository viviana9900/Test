class Teacher{
  int? id;
  String name;
  String lastName;
  String subject;
  String email;

  Teacher({ //creacion del constructor
    this.id, //parametro opcional
    required this.name, //parametro requerido 
    required this.lastName, //parametro requerido
    required this.subject, //parametro requerido 
    required this.email //parametro requerido
    });

    //crear la clase elteacher a teacher
    //esto se utiliza al momento de seleccionar los datos
    //acpta como paametro el tipo de diccionarios (Map)
    factory Teacher.fromDictionary(Map<String, dynamic> data) => Teacher(
      id: data['id'], //extraer id de la data 
      name: data['name'], //extraer name de la data
      lastName: data ['lastName'],
      subject: data['subject'], //extraer name de la data
      email: data ['email'] //extraer lastname de la data
    );

    //se crea la fincion para parse de clase a diccionario
    //esto se utiliza al moemento de registrar datos (insert, update)
    //no acepta nada como argumento
    Map<String, dynamic> toDictionary() => {
      'id': id, 
      'name': name, 
      'lastName':lastName, 
      'subject': subject, 
      'email':email,
    };

}