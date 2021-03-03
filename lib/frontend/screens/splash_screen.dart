import 'package:flutter/material.dart';
import 'package:flutter_intro/backend/config.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() { 
    super.initState();

    // ! Acá va Código de carga de la aplicación
    
    Config cfg = Config();

    
    cfg.init().then((value) {

      // Usar los valores de cfg
      print("SharedPrefs: ${value.map.toString()}");

      Navigator.pushReplacementNamed(context, '/home');
    }).catchError((e){

      // En caso de que algún keyword no exista, tira el error
      print('[\tERROR\t]: ${e.toString()}');
      Navigator.pushReplacementNamed(context, '/home');
      
    });

    /* Future.delayed(Duration(milliseconds: 12000), () {

      Navigator.pushReplacementNamed(context, '/home');

    }) */
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).scaffoldBackgroundColor,
      color: Colors.white,
      child: SpinKitCircle(color: Colors.grey, size: 60,),
    );
  }
}