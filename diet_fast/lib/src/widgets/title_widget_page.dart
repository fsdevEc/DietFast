import 'package:flutter/material.dart';

class TitleWidgetPage extends StatelessWidget {
  final String title;
  
  TitleWidgetPage({@required this.title});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height*0.025,
          left: screenSize.width*0.18,
          right: screenSize.width*0.08
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenSize.height*0.03,
                fontWeight: FontWeight.bold
              ),
            ),
            InkWell(
              child: Icon(Icons.info, color: Colors.white), 
              onTap: (){}
            ),
            InkWell(
              child: Icon(Icons.help, color: Colors.white,),
              onTap: (){}
            ),
            InkWell(
              child: Icon(Icons.share, color: Colors.white), 
              onTap: (){}
            ),

          ],
        ),
      ),
    );
  }
}