import 'package:flutter/material.dart';
import 'navigation_bar_login.dart';
import 'frontPageLogin.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //saca el debug
      title: "",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({Key? key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: NavigationBarLogin(),
      body: FrontPageLogin(),
    );
  }
} 

//ListView.builder lo voy a usar para ver la lista: 
// ListView.Builder(
//itemCount= arreglo.length(esto es para que no se vaya de rango)
//itemBuilder(context, index){return Widget con index, entra una vez a cada uno})
// con this.listanombre.remove(elementodeltipode la lista) para borrar uno 

/*
class Usuario {
  String name = "nombre";
  String username = "usuario";
  String password = "contraseña";
  String email = "email";
  Usuario(
      {required String oneName,
      required String oneUsername,
      required String onePassword,
      required String oneEmail}) {
    this.name = oneName;
    this.username = oneUsername;
    this.password = onePassword;
    this.email = oneEmail ;
  }
}

*/