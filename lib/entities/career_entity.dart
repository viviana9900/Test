class Career{
  int? id;
  String name;
  String faculty;
  String modality;
  String description;

  Career({ //creacion del constructor
    this.id, //parametro opcional
    required this.name, //parametro requerido 
    required this.faculty, 
    required this.modality, 
    required this.description,
    });

    //crear la clase el diccionario a la clase de diccionario
    //esto se utiliza al momento de seleccionar los datos
    //acpta como paametro el tipo de diccionarios (Map)
    factory Career.fromDictionary(Map<String, dynamic> data) => Career(
      id: data['id'], //extraer id de la data 
      name: data['name'], //extraer name de la data
      faculty: data ['faculty'], //extraer lastname de la data
      modality: data['modality'], //extraer name de la data
      description: data ['description']
    );

    //se crea la fincion para parse de clase a diccionario
    //esto se utiliza al moemento de registrar datos (insert, update)
    //no acepta nada como argumento
    Map<String, dynamic> toDictionary() => {
      'id': id, //asignar el valor de id en el diccionario
      'name': name, //asignar el valor de name del diccionario
      'faculty':faculty, // asignar el valor de lastname en el diccionario
      'modality': modality, //asignar el valor de name del diccionario
      'description':description, // asignar el valor de lastname en el diccionario
      
    };

}