import 'package:diet_fast/src/widgets/footer_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final pageViewController = new PageController();
  final listaImagenes = ['assets/img/dietfast0.png','assets/img/dietfast1.png','assets/img/dietfast2.png'];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _SlideShowDietFast(screenSize: screenSize, pageViewController: pageViewController, listaImagenes: listaImagenes),
          FooterHome(),
          Align(
            alignment: Alignment(-0.8, 0.1),
            child:_Title(),
          ),
          Align(
            alignment: Alignment(0, 0.7),
            child: _Resumen(screenSize: screenSize)
          ),
          Align(
            alignment: Alignment(0, 1),
            child: _ActionsFooter(screenSize: screenSize, pageController: pageViewController, numPaginas: listaImagenes.length),
          )
        ],
      ),
    );
  }
}

class _SlideShowDietFast extends StatelessWidget {
  const _SlideShowDietFast({
    @required this.screenSize,
    @required this.pageViewController,
    @required this.listaImagenes,
  });

  final Size screenSize;
  final PageController pageViewController;
  final List<String> listaImagenes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenSize.height*0.7,
      child: PageView.builder(
        controller: pageViewController,
        itemCount: listaImagenes.length,
        itemBuilder: (context, i) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(listaImagenes[i]), 
              fit: BoxFit.fill
            )
          ),
        ),
      )
    );
  }
}

class _Resumen extends StatelessWidget {
  const _Resumen({
    @required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80),
      width: double.infinity,
      height: screenSize.height*0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Ejemplo', 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 25, 
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'Aliqua do mollit est nostrud voluptate occaecat id mollit magna sint dolore sit elit. Irure anim in do tempor in proident mollit veniam minim qui sunt irure laboris.', 
            style: TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.justify,
          ),
        ],
      )
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'DietFast', 
      style: TextStyle(
        color: Colors.black, 
        fontSize: 32, 
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class _ActionsFooter extends StatelessWidget {
   _ActionsFooter({
    @required this.screenSize,
    @required this.pageController, 
    @required this.numPaginas,
  });

  final Size screenSize;
  final PageController pageController;
  final int numPaginas;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenSize.height*0.1,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _saltar(context),
          _siguiente(context),
        ],
      ),
    );
  }

  _saltar(BuildContext context) {
    return FlatButton(
      onPressed: (){
        Navigator.pushNamed(context, 'login');
      }, 
      child: Text(
        'saltar', 
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  _siguiente(BuildContext context) {
    return FlatButton(
      onPressed: (){
        if(pageController.page == numPaginas-1){
          Navigator.pushNamed(context, 'login');
        }else{
          pageController.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
        }        
      }, 
      child: Text(
        'siguiente', 
        style: TextStyle(color: Colors.white, fontSize: 18),
      )
    );
  }
}