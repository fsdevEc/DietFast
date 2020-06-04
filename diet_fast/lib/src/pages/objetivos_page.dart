import 'package:diet_fast/src/widgets/footer_general.dart';
import 'package:diet_fast/src/widgets/header_general.dart';
import 'package:diet_fast/src/widgets/textfield_shadow.dart';
import 'package:diet_fast/src/widgets/title_widget_page.dart';
import 'package:flutter/material.dart';


class ObjetivosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: FooterGeneral()
          ),
          _ListaObjetivos(),
          HeaderGeneral(),
          TitleWidgetPage(title: 'logra tus objetivos',),        
        ],
      ),
    );
  }
}

class _ListaObjetivos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: screenSize.height*0.15,),
          _SubTitleObjetivosPage(screenSize: screenSize),
          SizedBox(height: screenSize.height*0.03,),          
          TextFieldShadow(
            hintText: 'ingresa tu peso: Ejem: 58.5 kg',
            title: '¿Cuál es tu peso actual?',
            cursorColor: Color(0xff73a270),
            margin: EdgeInsets.only(bottom: 25),
          ),
          TextFieldShadow(
            hintText: 'ingresa tu estatura: Ejem: 1.78 mts',
            title: '¿Cuál es tu estatura actual?',
            cursorColor: Color(0xff73a270),
            margin: EdgeInsets.only(bottom: 25),
          ),
          TextFieldShadow(
            hintText: 'ingresa tu estatura: Ejem: 1.78 mts',
            title: '¿Cuál es tu talla actual?',
            cursorColor: Color(0xff73a270),
            margin: EdgeInsets.only(bottom: 25),
          ),
          TextFieldShadow(
            hintText: 'subir de peso / bajar de peso',
            title: '¿Cuál es tu objetivo?',
            cursorColor: Color(0xff73a270),
            margin: EdgeInsets.only(bottom: 25),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: RaisedButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, 'comida');
              },
              shape: StadiumBorder(),
              color: Color(0xff73a270),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Center(child: Text('siguiente', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SubTitleObjetivosPage extends StatelessWidget {
  const _SubTitleObjetivosPage({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: screenSize.width*0.1,
      ),
      child: RichText(
        maxLines: 2,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Hagamos\ntu dieta',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            ),
            TextSpan(
              text: ' Alexis',
              style: TextStyle(
                fontSize: 28,
                color: Color(0xff73a270),
                fontWeight: FontWeight.bold
              )
            ),
          ]
        ),
      ),
    );
  }
}