import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


/* 
 @  Uso esta clase para guardar preferencias del usuario o configuraciones pequeñas de la aplicacion y otros datos.
 * 
 @ La información se guarda de manera local
 * 
 @ No es eficiente usar este método para bases de datos locales

 * Usos:

 * // Para iniciar por primera vez (Lo pueden poner en el splash_screen inicial o en el main.dart)
    Config cfg = Config(); // Crear el objeto

    cfg.init().then((value) async {
      // Uso los valores
      print("SharedPrefs: ${value.map.toString()}");    
      a = map["valorDeA"];
    })
 * // Para guardar los datos de configuracion
    Config cfg = Config(); // Crear el objeto
    // Opcion 1: Asignar el objeto entero
    cfg.map = {
      'contInicio': 0,
      'numero': '134455',
      'status': true
    };
    // Opcion 2: Asignar un atributo del objeto
    cfg.map['status'] = false;
    cfg.save(); // Guardar el objeto en memoria
	* // Para cargar y usar los datos de configuración
		Config cfg = Config(); // Crear el objeto
		// Usar sus valores
		print(cfg.map.toString());
		A = cfg.map['keyword'];
 */



class Config{

  static const MAP_STR = "map_str"; // keyword del valor en memoria

  static final Config instance = Config._internal();
  Config._internal();

  factory Config()=>instance;


  //Campos a manejar
  SharedPreferences _sharedPreferences;
  Map map = {};

  Future<SharedPreferences> get preferences async{
    if(_sharedPreferences != null){
      return _sharedPreferences;
    }else{
      _sharedPreferences = await SharedPreferences.getInstance().catchError((error){
        print('[ SHARED PREF ERROR 1 ]: ${error.toString()}');
      });

      String str = _sharedPreferences.getString(MAP_STR) ?? "{}";

      try {
        map = jsonDecode(str);
      } catch (e) {
        print('[ SHARED PREF JSON ERROR 2 ]: ${e.toString()}');
        map = {};
      }

      return _sharedPreferences;
    }
  }
  Future<void> save() async {

    await _sharedPreferences.setString(MAP_STR, jsonEncode(map)).catchError((error){
      print('[ SHARED PREF ERROR 3 ]: ${error.toString()}');
    });
    return;
  }

  println(){
    print(JsonEncoder.withIndent('\t').convert(map));
  }

  Future<Config> init() async{
    _sharedPreferences = await preferences.catchError((error){
      print('[ SHARED PREF ERROR 4 ]: ${error.toString()}');
    });
    return this;
  }

	/* 
	 * Tengo entendido que esta función no es necesaria, dado que cuando crean el objeto se ejecuta la funcion:
	 !		Future<SharedPreferences> get preferences
	 *	La cual ya de por sí, carga los datos de la memoria en el buffer 'map'
	 * 
	 */
  /* Future<void> load() async{
    _sharedPreferences = await SharedPreferences.getInstance().catchError((error){
      print('[ SHARED PREF ERROR 5 ]: ${error.toString()}');
    });

    String str = _sharedPreferences.getString(MAP_STR) ?? "{}";

    try {
      map = jsonDecode(str);
    } catch (e) {
      print('[ SHARED PREF ERROR 6 ]: ${e.toString()}');
      map = {};
    }
  } */
}