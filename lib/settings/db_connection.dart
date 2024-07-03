import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbConnection { 
  static const version = 1; //version de conexion, por default va 1 siempre
  static const dbName = 'octavo_utc.db'; //nombre de la bdd sqlite


//metodo de conexion
  static Future <Database> getConnection() async {//declarar funcion asincrona llamada getConexion
    return openDatabase(
      join(//concatenar la ruta absoluta con el nombre de la base de datos
      await getDatabasesPath(), //lamar a funcion asincrona que contiene la ruta de base de datos estandar
      dbName //nombre de la bdd en este caso octavo_utc.db
      ), 
      onCreate: (db, version) async => {//evento para crear la bdd
      //primer paramettro es un alias que se designa a la bdd
      //segundo parametro hace referencia a la version que esta en la linea 5
      //en esta funcion se crean tablas o datos inciales
      await db.execute("CREATE TABLE estudiante (id INTEGER PRIMARY KEY, name TEXT, last_name TEXT)"), //creacion de tabla ESTUDIANTE con lenguaje SQL utilizando el metodo EXECUTE
      
      
      await db.execute("CREATE TABLE carrera (id INTEGER PRIMARY KEY, name TEXT, faculty TEXT, modality TEXT, description TEXT)"), //creacion de tabla ESTUDIANTE con lenguaje SQL utilizando el metodo EXECUTE
      await db.execute("CREATE TABLE docente (id INTEGER PRIMARY KEY, name TEXT, last_name TEXT, subject TEXT, email TEXT)"), //creacion de tabla ESTUDIANTE con lenguaje SQL utilizando el metodo EXECUTE
      await db.execute("CREATE TABLE Facultad (id INTEGER PRIMARY KEY, name TEXT, description TEXT, email TEXT, phone Number)"), //creacion de tabla ESTUDIANTE con lenguaje SQL utilizando el metodo EXECUTE

      // para crear otra tabla await db.execute("CREATE TABLE docente (id INTEGER PRIMARY KEY, name TEXT, last_name TEXT)"),
      await db.execute("INSERT INTO estudiante VALUES (1, 'DIEGO', 'FALCONI)")
      //creacion de un registro en la tabla estudiante

      },
      version: version //version de la base de datos
    ); //abrir la conexion
    } //devuelve el tipo de dato llamado Database 


    static Future<int> insert(String table, dynamic data) async {//creacion del metodo insert
    //primer parametro nombre de la tabla
    //segundo parametro hace referencia  la clase
    final db = await getConnection(); //llamada a la funcion 
    return db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace); //llamado a la funcion insert
    }

    static Future<int> update(String table, dynamic data, int id) async {
      final db = await getConnection(); //llamada a la funcion 
      return db.update(
      table, //nombre de la tabla 
      data,  //data a actualizar
      where: 'id - ?',  //where del argumento que en este caso es el id
      whereArgs: [id]);  //llamado a la variable id
    }

    static Future<int> delete (String table, int id) async {
      //creacion de la funcion para eliminar 
      //primer parametro es el nombre de la tabla
      //segundo es el id del registro
      final db = await getConnection();
      return db.delete(table, 
      where: 'id = ?', // llamado de la funcion 
      whereArgs: [id] //llamado de laa variable
      );
    }

  static Future<List<Map<String, dynamic >>> list(String table) async{
    //funcion para listar datos de una tabla 
    //primer parametro en el nombre de la tabla 
    //retornar una lista de diccionarios
    final db = await getConnection(); // llamado de la funcion de conexion
    return db.query(table); //llamado de la conexion de select
  }

  static Future<List<Map<String, dynamic >>> detail(String table, String where, dynamic args) async{
    //funcion para listar datos de una tabla 
    //primer parametro en el nombre de la tabla 
    //retornar una lista de diccionarios
    //tercer parametro son los valores de los argumentos 
    //retornar una lista de diccionarios
    final db = await getConnection(); // llamado de la funcion de conexion
    return db.query(table, where: where, whereArgs: args); //llamado de la conexion de select
  }

} 