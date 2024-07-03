class Faculty{
  int? id;
  String name;
  String description;
  String email;
  String phone;


  Faculty({ //creacion del constructor
    this.id, //parametro opcional
    required this.name, //parametro requerido 
    required this.description, //parametro requerido
    required this.email, //parametro requerido 
    required this.phone
   
    });

    //crear la clase el diccionario a la clase de diccionario
    //esto se utiliza al momento de seleccionar los datos
    //acpta como paametro el tipo de diccionarios (Map)
    factory Faculty.fromDictionary(Map<String, dynamic> data) => Faculty(
      id: data['id'],
      name: data['name'], 
      description: data ['description'], 
      email: data['email'],  
      phone: data['phone'], 
    );

    //se crea la fincion para parse de clase a diccionario
    //esto se utiliza al moemento de registrar datos (insert, update)
    //no acepta nada como argumento
    Map<String, dynamic> toDictionary() => {
      'id': id, 
      'name': name, 
      'description':description, 
      'email': email, 
      'phone': phone, 

      
    };

}