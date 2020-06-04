import 'package:diet_fast/src/widgets/floating_nav_bar.dart';
import 'package:diet_fast/src/widgets/footer_general.dart';
import 'package:diet_fast/src/widgets/header_general.dart';
import 'package:diet_fast/src/widgets/title_widget_page.dart';
import 'package:flutter/material.dart';

class ComidaDescripcionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenSize.height,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0, -0.85),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: screenSize.height*0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(image: AssetImage('assets/img/dietfast2.png'), fit: BoxFit.cover)
                    ),
                  ),
                  SizedBox(height: screenSize.height*0.05,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: screenSize.width*0.1,),
                      Container(
                        width: screenSize.width*0.5,
                        child: Text(
                          'Comida 2',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: screenSize.height*0.04,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      BackButton(
                        color: Colors.black,                        
                      )
                    ],
                  ),
                  SizedBox(height: screenSize.height*0.025,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(width: screenSize.width*0.04,),
                      _NutritionInformation(screenSize: screenSize, color: Colors.red, text: '243', subtitle: 'calorias',),
                      _NutritionInformation(screenSize: screenSize, text: '9.8g', subtitle: 'grasa',),
                      _NutritionInformation(screenSize: screenSize, text: '40.7g', subtitle: 'carbohid.',),
                      _NutritionInformation(screenSize: screenSize, text: '8.7g', subtitle: 'proteinas',),
                      SizedBox(width: screenSize.width*0.05,),
                    ],
                  ),
                  SizedBox(height: screenSize.height*0.025,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: screenSize.width*0.1,),
                      Text(
                      'Lorem Ipsum',
                      style: TextStyle(
                        fontSize: screenSize.height*0.03,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                      SizedBox(width: screenSize.width*0.05,),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.1, vertical: screenSize.height*0.01),
                    child: Text('Veniam aute ex nostrud aliquip excepteur do sit. Ullamco excepteur et voluptate do officia ipsum. Ullamco nisi officia pariatur in cupidatat aliquip aliqua laborum laboris sint aute.'),
                  )
                ],
              )
            ),
            HeaderGeneral(),
            TitleWidgetPage(title: 'nunca te rindas'),
            Align(
              alignment: Alignment.bottomCenter,
              child: FooterGeneral()
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingNavBar(
                activeColor: Color(0xff73a270),
                inactiveColor: Colors.grey
              ),
            )

          ],
        ),
      )
   );
  }
}

class _NutritionInformation extends StatelessWidget {
  const _NutritionInformation({
    @required this.screenSize,
    @required this.text,
    @required this.subtitle,
    this.color = Colors.black,
  });

  final Size screenSize;
  final String text;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(text,
          style: TextStyle(
            fontSize: screenSize.height*0.03,
            fontWeight: FontWeight.bold,
            color: color                        
          ),
        ),
        Text(subtitle,
          style: TextStyle(
            fontSize: screenSize.height*0.02,
            fontWeight: FontWeight.bold,
            color: Colors.grey                        
          ),
        ),
      ],
    );
  }
}