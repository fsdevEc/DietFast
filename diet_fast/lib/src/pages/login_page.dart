import 'package:diet_fast/src/widgets/footer_login.dart';
import 'package:diet_fast/src/widgets/header_login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            HeaderLogin(),
            FooterLogin(),
            Positioned(
              right: screenSize.width*0.06,
              top: screenSize.height*0.025,
              child: SafeArea(child: _PlayIcon())
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: screenSize.width*0.12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: screenSize.height*0.25,),
                    _WelcomeMessage(),
                    SizedBox(height: screenSize.height*0.025,),
                    _LoginForm(screenSize: screenSize),
                    SizedBox(height: screenSize.height*0.025,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    @required this.screenSize,
  });

  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    //final loginPageModel = Provider.of<_LoginPageModel>(context);
    return Container(
      width: screenSize.width*0.55,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'correo electrónico'
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'contraseña'
            ),
          ),
          SizedBox(height: 35,),
          RaisedButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, 'objetivos');
            },
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Center(child: Text('Ingresar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),),
            shape: StadiumBorder(),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: (){}, 
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: '¿No tienes una cuenta, ', style: TextStyle(color: Colors.grey, fontSize: 11)),
                      TextSpan(text: 'Registrate', style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
                      TextSpan(text: '?', style: TextStyle(color: Colors.grey, fontSize: 11)),
                    ]
                  )
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}



class _WelcomeMessage extends StatelessWidget {
  const _WelcomeMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'bienvenido',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
          ),
          SizedBox(height: 20,),
          Text(
            'DietFast',
            style: TextStyle(
              color: Color(0xff73a270),
              fontWeight: FontWeight.bold,
              fontSize: 45
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayIcon extends StatelessWidget {
  const _PlayIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'video',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold                     
            ),
          ),
          Icon(Icons.play_arrow, color: Colors.white, size: 30,)
        ],
      ),
    );
  }
}
