import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_intro/backend/config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicación"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: (){

                      Config cfg = Config(); // Crear el objeto

                      // Opcion 1: Asignar el objeto entero
                      cfg.map = {
                        'contInicio': 0,
                        'numero': '134455',
                        'status': true,
                      };

                      // Opcion 2: Asignar un atributo del objeto
                      cfg.map['status'] = false;

                      cfg.save(); // Guardar el objeto en memoria
                    
                    },
                    child: Text('Guardar Json'),
                  ),

                  RaisedButton(
                    onPressed: (){
                    // int a = data["contInicio"];

                      Config cfg = Config();
                      print('Este es el json: ${cfg.map.toString()}');
                      if(cfg.map['contInicio'] > 0)
                      {
                        print('No es nuevo usuario');
                      }
                      else
                      {
                        print('Nuevo user!');
                      }                  
                    },
                    child: Text('Ver json'),
                  ),
                  // Expanded(child: Container(child: Placeholder())),
                ],
              )
            ],
          ),
        ),
      ),
      /* body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  
                ],
              ),
            ],
          ),
        ],
      ), */
    );
  }
}