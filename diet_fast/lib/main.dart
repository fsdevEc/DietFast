import 'package:diet_fast/src/pages/comida_descripcion.dart';
import 'package:diet_fast/src/pages/comidas_page.dart';
import 'package:diet_fast/src/pages/home.dart';
import 'package:diet_fast/src/pages/login_page.dart';
import 'package:diet_fast/src/pages/objetivos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main(){
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light
    )
  );
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'objetivos',
      routes: {
        'home'      : (BuildContext context) => HomePage(),
        'login'     : (BuildContext context) => LoginPage(),
        'objetivos' : (BuildContext context) => ObjetivosPage(),
        'comida'    : (BuildContext context) => ComidasPage(),
        'comidaDescripcion' : (BuildContext context) => ComidaDescripcionPage(),
      },
      theme: ThemeData(
        primaryColor: Color(0xff73a270)
      )
    );
  }
}